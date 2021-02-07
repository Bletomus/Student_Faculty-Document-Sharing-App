import 'dart:async';

import 'package:models/FacultyNotifications.dart';
import 'package:networking/Response.dart';
import 'package:repository/FacultyNotificationsRepository.dart';

class FacultyNotificationsBloc
{
  FacultyNotificationsRepository facultyNotificationsRepository = null;
  StreamController notificationController = null;

  StreamSink<Response<dynamic>> get notificationSink => notificationController.sink;

  Stream<Response<dynamic>> get notificationStream => notificationController.stream;

  String userId;
  FacultyNotificationsBloc(String userId)
  {
    notificationController = StreamController<Response<dynamic>>();
    facultyNotificationsRepository = FacultyNotificationsRepository();
    this.userId = userId;
    fetchResult();
  }

  fetchResult() async
  {
    notificationSink.add(Response.loading('Looking for Information!'));
    try
    {
      List<FacultyNotifications> notifications= await facultyNotificationsRepository.fetchFacultyNotifications(userId);
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