import 'package:app_constants/ThemeConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:models/Teaches.dart';
import 'package:user_info_widgets/TextBoxHeadingsAndContent.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';

import 'FileListing.dart';
import 'Filter.dart';

class Semesters extends StatelessWidget
{
  final List<Teaches> teaches;
  final String course;
  final String location;
  Semesters({Key key, this.teaches,this.course,this.location}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    List<Teaches> filtered = FacultyFilter.getSemester(teaches, course);
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
              child: Text.rich(TextSpan(text: filtered[index].teacherSchedule.scheduledSemester.semesterName,style: TextStyle(fontSize:ConstantVariables.singleHeaderSize,fontFamily: "Poppins",color: ConstantVariables.headingTextColor)),textAlign: TextAlign.start,),
            ),
            onTap:
                ()
            {
              Navigator.push
              (
                context,MaterialPageRoute(builder: (context) =>  FileListing(teaches:filtered[index],location: (location + filtered[index].teacherSchedule.scheduledSemester.semesterName + " "),) ,),
              );

            }
        );
      },
      shrinkWrap: true
        ,)
    );
  }

}