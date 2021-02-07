import 'dart:async';

import 'package:models/StudentSchedule.dart';
import 'package:networking/Response.dart';
import 'package:repository/StudentScheduleRepository.dart';

class StudentScheduleBloc
{
  StudentScheduleRepository studentScheduleRepository = null;
  StreamController scheduleController = null;

  StreamSink<Response<dynamic>> get scheduleSink => scheduleController.sink;

  Stream<Response<dynamic>> get scheduleStream => scheduleController.stream;

  String userId;
  StudentScheduleBloc(String userId)
  {
    scheduleController = StreamController<Response<dynamic>>();
    studentScheduleRepository = StudentScheduleRepository();
    this.userId = userId;
    fetchResult();
  }

  fetchResult() async
  {
    scheduleSink.add(Response.loading('Looking for Information!'));
    try
    {
      List<StudentSchedule> schedule= await studentScheduleRepository.fetchStudentSchedule(userId);
      scheduleSink.add(Response.completed(schedule));
    }
    catch (e)
    {
      scheduleSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose()
  {
    scheduleController?.close();
  }
}