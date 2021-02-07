
import 'package:app_constants/ThemeConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:models/Teaches.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:user_info_widgets/TextBoxHeadingsAndContent.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';

import 'Assignments.dart';
import 'Resources.dart';
import 'Submission.dart';

class FileListing extends StatelessWidget
{
  final Teaches teaches;
  final String location;
  FileListing({Key key, this.teaches,this.location}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    List<String> options = ["Assignments","Resources","Submissions"];

    return whiteBackGroundWidget(insiderWidget: ListView.builder
      (
      itemCount: options.length,
      itemBuilder: (context,index)
      {
        return GestureDetector
          (
            child: Container
            (
              decoration: border(),
              margin: EdgeInsets.fromLTRB(ConstantVariables.marginLeft,ConstantVariables.marginTop,ConstantVariables.marginRight,ConstantVariables.marginBottom),
              child: Text.rich(TextSpan(text: options[index],style: TextStyle(fontSize:ConstantVariables.singleHeaderSize,fontFamily: "Poppins",color: ConstantVariables.headingTextColor)),textAlign: TextAlign.start,),
            ),
            onTap:
            ()
            {
              if(index == 0)
                pushNewScreen(
                  context,
                  screen: Assignments(teaches: teaches,location: (location + options[0]),),
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );

              if(index == 1)
                pushNewScreen(
                  context,
                  screen: Resources(teaches: teaches,location: (location + options[1]),),
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );

              if(index == 2)
                pushNewScreen(
                  context,
                  screen: Submissions(teaches: teaches,location: (location + options[2]),),
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );

            }
        );
      },
      shrinkWrap: true
      ,)
    );
  }
}