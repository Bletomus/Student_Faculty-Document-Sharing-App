import 'package:app_constants/ThemeConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:models/StudentTakes.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:user_info_widgets/TextBoxHeadingsAndContent.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';

import 'Assignment.dart';
import 'Resources.dart';
import 'Submissions.dart';

class FileListing extends StatelessWidget
{
  final StudentTakes student;
  final String location;
  FileListing({Key key, this.student,this.location}) : super(key: key);
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
                  screen: Assignments(location: (location + options[0]),),
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );

              if(index == 1)
                pushNewScreen(
                  context,
                  screen: Resources(personID: student.studentTaking.id,location: (location + options[1]),),
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );

              if(index ==  2)
                pushNewScreen(
                  context,
                  screen: Submissions(personID: student.studentTaking.id,location: (location + options[2]),),
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