
import 'package:app_constants/LoginInformation.dart';
import 'package:blocs/StudentScheduleBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/LoadingWidgets.dart';
import 'package:models/StudentSchedule.dart';
import 'package:networking/Response.dart';
import 'package:user_info_widgets/BlueBackGround.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';

import 'CourseBox.dart';
LoginVariables userCredentials;
List<StudentSchedule> schedules;

class StudentSemesterSchedule extends StatefulWidget
{

  StudentSemesterSchedule(LoginVariables user)
  {
    userCredentials = user;
  }

  @override
  _StudentScheduleState createState() => _StudentScheduleState();
}

class _StudentScheduleState extends State<StudentSemesterSchedule>
{
  StudentScheduleBloc studentScheduleBloc;
  @override
  void initState()
  {
    studentScheduleBloc = StudentScheduleBloc(userCredentials.user_id);
  }

  @override
  Widget build(BuildContext context)
  {
    return StreamBuilder<Response<dynamic>>
      (
      stream: studentScheduleBloc.scheduleStream,
      builder: (context,snapshot)
      {
        if (snapshot.hasData)
        {
          switch (snapshot.data.status)
          {
            case Status.LOADING:

              break;
            case Status.COMPLETED:
              schedules = snapshot.data.data;
              return SemesterSchedules();
              break;
            default:
              return Text("There seems to be a problem with the connection!",style: TextStyle(color: Colors.black, fontSize: 24,),);
              break;
          }
        }


        return whiteBackGroundWidget(insiderWidget: LoadingCircle(),);
      },
    );
  }
}

class SemesterSchedules extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlueBackGroundWidget
    (
      insiderWidget: ScheduleList(studentSchedule: schedules,),
    );

  }

}