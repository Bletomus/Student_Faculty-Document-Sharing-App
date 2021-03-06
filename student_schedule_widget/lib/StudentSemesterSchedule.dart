
import 'package:app_constants/LoginInformation.dart';
import 'package:blocs/StudentScheduleBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/DialogBox.dart';
import 'package:general_widgets/LoadingWidgets.dart';
import 'package:general_widgets/NoConnection.dart';
import 'package:models/StudentSchedule.dart';
import 'package:networking/Response.dart';
import 'package:user_info_widgets/BlueBackGround.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';
import 'package:view/StudentHome.dart';
import 'package:view/SubmitForm.dart';
import 'CourseBox.dart';


class StudentSemesterSchedule extends StatefulWidget
{

  StudentSemesterSchedule({Key key,this.userCredentials}) : super(key: key);
  final LoginVariables userCredentials;

  @override
  _StudentScheduleState createState() => _StudentScheduleState();
}

class _StudentScheduleState extends State<StudentSemesterSchedule>
{
  StudentScheduleBloc _studentScheduleBloc;

  @override
  void initState()
  {
    super.initState();
    
    _studentScheduleBloc = StudentScheduleBloc(widget.userCredentials.user_id);
  }

  @override
  Widget build(BuildContext context)
  {
    return StreamBuilder<Response<dynamic>>
      (
      stream: _studentScheduleBloc.scheduleStream,
      builder: (context,snapshot)
      {
        if (snapshot.hasData)
        {
          switch (snapshot.data.status)
          {
            case Status.LOADING:
              return whiteBackGroundWidget(insiderWidget: LoadingCircle(),);
              break;
            case Status.COMPLETED:

              return SemesterSchedules(schedules: snapshot.data.data);
              break;
            default:
              WidgetsBinding.instance.addPostFrameCallback
                (
                  (_)
                  {
                    DialogBox.showMessage(context, "Error Loading", "There seems to be a problem with the connection!! Please verify connection and try again");
                  }
              );
              break;
          }
        }
        else
        {

          return StudentHome(userCredentials: widget.userCredentials);
        }

        return whiteBackGroundWidget(insiderWidget: LoadingCircle(),);

      },
    );
  }
}

class SemesterSchedules extends StatelessWidget
{

  SemesterSchedules({Key key,this.schedules}) : super(key: key);
  final List<StudentSchedule> schedules;

  @override
  Widget build(BuildContext context)
  {
    return BlueBackGroundWidget
    (
      insiderWidget: ScheduleList(studentSchedule: schedules,),
    );

  }

}