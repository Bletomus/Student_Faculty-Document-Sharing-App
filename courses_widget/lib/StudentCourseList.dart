import 'package:app_constants/LoginInformation.dart';
import 'package:blocs/CoursesBlocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/DialogBox.dart';
import 'package:general_widgets/LoadingWidgets.dart';
import 'package:models/Courses.dart';
import 'package:networking/Response.dart';
import 'package:user_info_widgets/BlueBackGround.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';
import 'package:view/StudentHome.dart';
import 'CourseList.dart';

class StudentCourseList extends StatefulWidget
{
  StudentCourseList({Key key,this.userCredentials}) : super(key: key);
  final LoginVariables userCredentials;

  @override
  _StudentCourseListState createState() => _StudentCourseListState();

}

class _StudentCourseListState extends State<StudentCourseList>
{

  CoursesBlocs _coursesBlocs;
  static LoginVariables _userCredentials;
  @override
  void initState()
  {
    super.initState();
    _userCredentials= widget.userCredentials;
    _coursesBlocs = CoursesBlocs(widget.userCredentials.user_id);
  }
  @override
  Widget build(BuildContext context)
  {
    return StreamBuilder<Response<dynamic>>
      (
      stream: _coursesBlocs.courseStream,
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
              return CoursesView(courses: snapshot.data.data,);
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
        WidgetsBinding.instance.addPostFrameCallback
          (
            (_)
            {
              DialogBox.showMessage(context, "Error Loading", "There seems to be a problem with the app, please send us feedback on the error and we will get to you soon!");
            }
        );
        return StudentHome(userCredentials: _userCredentials);
      },
    );
  }

}

class CoursesView extends StatelessWidget
{
  CoursesView({Key key,this.courses}) : super(key: key);
  final List<Courses> courses;

  @override
  Widget build(BuildContext context)
  {
    return BlueBackGroundWidget
    (
      insiderWidget: CourseList(courses: courses),
    );
  }
}