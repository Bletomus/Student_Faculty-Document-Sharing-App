
import 'dart:async';

import 'package:models/StudentInfo.dart';
import 'package:models/TeacherInfo.dart';
import 'package:networking/Response.dart';
import 'package:repository/UserInfoRepository.dart';

class UserInfoBloc
{
  UserInfoRepository userInfoRepository = null;
  StreamController infoController = null;

  StreamSink<Response<dynamic>> get infoSink => infoController.sink;

  Stream<Response<dynamic>> get infoStream => infoController.stream;
  String userId;
  int choice = 1;
  UserInfoBloc(int choice, String userId)
  {
    infoController = StreamController<Response<dynamic>>();
    userInfoRepository = UserInfoRepository(choice);
    this.choice = choice;
    this.userId = userId;
    fetchResult();
  }

  fetchResult() async
  {
    infoSink.add(Response.loading('Looking for Information!'));
    try
    {
      if(choice == 1)
      {
        StudentInfo studentInfo= await userInfoRepository.fetchUserInfo(userId);
        infoSink.add(Response.completed(studentInfo));
      }
      else
      {
        FacultyInfo facultyInfo = await userInfoRepository.fetchUserInfo(userId);
        infoSink.add(Response.completed(facultyInfo));
      }
    }
    catch (e)
    {
      infoSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose()
  {
    infoController?.close();
  }
}