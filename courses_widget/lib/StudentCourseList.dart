import 'package:app_constants/LoginInformation.dart';
import 'package:blocs/CoursesBlocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/LoadingWidgets.dart';
import 'package:models/Courses.dart';
import 'package:networking/Response.dart';
import 'package:user_info_widgets/BlueBackGround.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';

import 'CourseList.dart';

LoginVariables userCredentials;
List<Courses> courses;
class StudentCourseList extends StatefulWidget
{
  StudentCourseList(LoginVariables loginVariables)
  {
    userCredentials = loginVariables;
  }

  @override
  _StudentCourseListState createState() => _StudentCourseListState();

}

class _StudentCourseListState extends State<StudentCourseList>
{

  CoursesBlocs coursesBlocs;
  @override
  void initState()
  {
    coursesBlocs = CoursesBlocs(userCredentials.user_id);
  }
  @override
  Widget build(BuildContext context)
  {
    return StreamBuilder<Response<dynamic>>
      (
      stream: coursesBlocs.courseStream,
      builder: (context,snapshot)
      {
        if (snapshot.hasData)
        {
          switch (snapshot.data.status)
          {
            case Status.LOADING:

              break;
            case Status.COMPLETED:
              courses = snapshot.data.data;
              return CoursesView();
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

class CoursesView extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlueBackGroundWidget
    (
      insiderWidget: CourseList(courses: courses),
    );
  }
}