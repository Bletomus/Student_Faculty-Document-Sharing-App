import 'package:app_constants/LoginInformation.dart';
import 'package:blocs/StudentTakesBlocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/LoadingWidgets.dart';
import 'package:models/StudentTakes.dart';
import 'package:networking/Response.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';

import 'Courses.dart';


class StudentRAndA extends StatefulWidget
{
  LoginVariables userCredentials;
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
              return Text("There seems to be a problem with the connection!",style: TextStyle(color: Colors.black, fontSize: 24,),);
              break;
          }
        }
        else
          return Text("error");
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