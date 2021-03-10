import 'package:app_constants/ThemeConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:models/Teaches.dart';
import 'package:user_info_widgets/TextBoxHeadingsAndContent.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';

import 'Courses.dart';
import 'Filter.dart';

class Majors extends StatelessWidget
{
  final List<Teaches> teaches;
  final String dept;
  Majors({Key key, this.teaches,this.dept}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    String location = dept + " ";
    List<Teaches> filtered = FacultyFilter.getFilteredMajor(teaches, dept);
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
              child: Text.rich(TextSpan(text: filtered[index].teacherSchedule.scheduledMajor.major,style: TextStyle(fontSize:ConstantVariables.singleHeaderSize,fontFamily: "Poppins",color: ConstantVariables.headingTextColor)),textAlign: TextAlign.start,),
            ),
            onTap:
                ()
            {
              Navigator.push
              (
                context,MaterialPageRoute(builder: (context) => Courses(teaches: filtered,major:filtered[index].teacher.facultyMajor.major ,location: (location+ filtered[index].teacher.facultyMajor.major + " "),)),
              );

            }
        );
      },
      shrinkWrap: true
      ,)
    );
  }

}