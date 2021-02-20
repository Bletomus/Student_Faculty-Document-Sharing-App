
import 'package:course_info_widgets/CourseListBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:models/StudentSchedule.dart';

class ScheduleList extends StatelessWidget
{
  final List<StudentSchedule> studentSchedule;
  ScheduleList({Key key, this.studentSchedule}) : super(key:key);

  @override
  Widget build(BuildContext context)
  {
    return CourseListBox(courses: studentSchedule,type: 3,);
  }
}

