import 'package:app_constants/ThemeConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:models/StudentTakes.dart';
import 'package:student_upload_download_widget/Filter.dart';
import 'package:user_info_widgets/TextBoxHeadingsAndContent.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';

import 'FileListing.dart';

class Semesters extends StatelessWidget
{
  final List<StudentTakes> student;
  final String course;
  final String location;
  Semesters({Key key, this.student,this.course,this.location}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    List<String> filtered = StudentFilter.getSemester(student, course);
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
              child: Text.rich(TextSpan(text: filtered[index],style: TextStyle(fontSize:ConstantVariables.singleHeaderSize,fontFamily: "Poppins",color: ConstantVariables.headingTextColor)),textAlign: TextAlign.start,),
            ),
            onTap:
                ()
            {
              String loci = location + filtered[index] + " ";
              Navigator.push
              (
                context,MaterialPageRoute(builder: (context) => FileListing(student: student[0],location: loci), ),
              );

            }
        );
      },
      shrinkWrap: true
      ,)
    );
  }

}