import 'package:app_constants/LoginInformation.dart';
import 'package:blocs/StudentTakesBlocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/DialogBox.dart';
import 'package:general_widgets/LoadingWidgets.dart';
import 'package:general_widgets/NoConnection.dart';
import 'package:models/StudentTakes.dart';
import 'package:networking/Response.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';
import 'package:view/StudentHome.dart';
import 'package:view/SubmitForm.dart';

import 'Courses.dart';


class StudentRAndA extends StatefulWidget
{
  final LoginVariables userCredentials;
  StudentRAndA({Key key, this.userCredentials,}) : super(key: key);
  @override
  StudentState createState() =>  StudentState();

}

class StudentState extends State<StudentRAndA>
{
  StudentTakesBlocs studentTakesBloc;
  @override
  Widget build(BuildContext context)
  {
    return StreamBuilder<Response<dynamic>>
      (
      stream: studentTakesBloc.studentStream,
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
              List<StudentTakes> students = snapshot.data.data;
              StudentTakes student = students[0];
              String dept = student.studentTaking.studentMajor.majorDepartment.departmentName + " ";
              String major = student.studentTaking.studentMajor.major + " ";
              String location = dept + major;

              return Courses(student: students,location:location);
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

  @override
  void initState()
  {
    super.initState();
    studentTakesBloc = StudentTakesBlocs(widget.userCredentials.user_id);
  }
}