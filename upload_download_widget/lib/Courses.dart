import 'package:app_constants/ThemeConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:models/Teaches.dart';
import 'package:user_info_widgets/TextBoxHeadingsAndContent.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';

import 'Filter.dart';
import 'Semester.dart';

class Courses extends StatelessWidget
{
  final List<Teaches> teaches;
  final String major;
  final String location;
  Courses({Key key, this.teaches,this.major,this.location}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    List<Teaches> filtered = FacultyFilter.getCourses(teaches, major);
    return whiteBackGroundWidget(insiderWidget: ListView.builder
      (
      itemCount: filtered.length,
      itemBuilder: (context,index)
      {
        return GestureDetector
          (
            child: Container
              (
              decoration: border(),
              margin: EdgeInsets.fromLTRB(ConstantVariables.marginLeft,ConstantVariables.marginTop,ConstantVariables.marginRight,ConstantVariables.marginBottom),
              child: Text.rich(TextSpan(text: filtered[index].teacherSchedule.scheduledCourse.courseName,style: TextStyle(fontSize:ConstantVariables.singleHeaderSize,fontFamily: "Poppins",color: ConstantVariables.headingTextColor)),textAlign: TextAlign.start,),
            ),
            onTap:
                ()
            {
              Navigator.push
              (
                context,MaterialPageRoute(builder: (context) => Semesters(teaches: filtered,course: filtered[index].teacherSchedule.scheduledCourse.courseName,location: (location + filtered[index].teacherSchedule.scheduledCourse.courseName + " "),),),
              );

            }
        );
      },
      shrinkWrap: true
      ,)
    );
  }

}