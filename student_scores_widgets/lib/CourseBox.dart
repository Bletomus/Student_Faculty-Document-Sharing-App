
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:models/StudentScores.dart';
import 'package:course_info_widgets/CourseListBox.dart';

class ScoreList extends StatelessWidget
{
  final List<StudentScores> studentScores;
  ScoreList({Key key, this.studentScores}) : super(key:key);

  @override
  Widget build(BuildContext context)
  {
    return CourseListBox(courses: studentScores,type: 1,);
  }
}

