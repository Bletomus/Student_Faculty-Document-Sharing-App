import 'package:flutter/cupertino.dart';
import 'package:models/Courses.dart';
import 'package:course_info_widgets/CourseListBox.dart';

class CourseList extends StatelessWidget
{
  final List<Courses> courses;
  CourseList({Key key, this.courses}) : super(key:key);
  @override
  Widget build(BuildContext context)
  {
    return CourseListBox(courses: courses,type: 2,);
  }
}