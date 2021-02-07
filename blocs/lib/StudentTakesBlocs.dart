import 'dart:async';

import 'package:models/StudentTakes.dart';
import 'package:networking/Response.dart';
import 'package:repository/StudentTakesRepository.dart';

class StudentTakesBlocs
{
  StudentTakesRepository studentTakesRepository = null;
  StreamController studentTakesController = null;

  StreamSink<Response<dynamic>> get studentSink => studentTakesController.sink;

  Stream<Response<dynamic>> get studentStream => studentTakesController.stream;

  String userId;
  StudentTakesBlocs(String userId)
  {
    studentTakesController = StreamController<Response<dynamic>>();
    studentTakesRepository = StudentTakesRepository();
    this.userId = userId;
    fetchResult();
  }

  fetchResult() async
  {
    studentSink.add(Response.loading('Looking for Information!'));
    try
    {
      List<StudentTakes> studentTakes= await studentTakesRepository.fetchStudentTakes(userId);
      studentSink.add(Response.completed(studentTakes));
    }
    catch (e)
    {
      studentSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose()
  {
    studentTakesController?.close();
  }
}