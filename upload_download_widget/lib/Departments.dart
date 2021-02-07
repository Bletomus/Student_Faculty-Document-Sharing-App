
import 'package:app_constants/ThemeConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:models/Teaches.dart';
import 'package:user_info_widgets/TextBoxHeadingsAndContent.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';

import 'Filter.dart';
import 'Majors.dart';

class Departments extends StatelessWidget
{

  List<Teaches> teaches;
  Departments({Key key, this.teaches}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    List<String> filtered;

    filtered =FacultyFilter.getUniqueDept(teaches);
    debugPrint(filtered[0]);
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
              Navigator.push
              (
                context,MaterialPageRoute(builder: (context) => Majors(teaches: teaches, dept: filtered[index]),),
              );

            }
        );

      },
      shrinkWrap: true,
      )
    );
  }

}