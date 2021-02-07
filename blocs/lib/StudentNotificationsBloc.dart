
import 'dart:async';

import 'package:models/StudentNotifications.dart';
import 'package:networking/Response.dart';
import 'package:repository/StudentNotificationsRepository.dart';



class StudentNotificationsBloc
{
  StudentNotificationsRepository studentNotificationsRepository = null;
  StreamController notificationController = null;

  StreamSink<Response<dynamic>> get notificationSink => notificationController.sink;

  Stream<Response<dynamic>> get notificationStream => notificationController.stream;

  String userId;
  StudentNotificationsBloc(String userId)
  {
    notificationController = StreamController<Response<dynamic>>();
    studentNotificationsRepository = StudentNotificationsRepository();
    this.userId = userId;
    fetchResult();
  }

  fetchResult() async
  {
    notificationSink.add(Response.loading('Looking for Information!'));
    try
    {
      List<StudentNotifications> notifications= await studentNotificationsRepository.fetchStudentNotifications(userId);
      notificationSink.add(Response.completed(notifications));
    }
    catch (e)
    {
      notificationSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose()
  {
    notificationController?.close();
  }
}