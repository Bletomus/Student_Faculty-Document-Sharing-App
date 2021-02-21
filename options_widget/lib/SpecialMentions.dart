import 'package:app_constants/ThemeConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/Rower.dart';
import 'package:options_widget/InAppBrowser.dart';
import 'package:user_info_widgets/BlueBackGround.dart';
import 'CreditObject.dart';


class SpecialMentions extends StatelessWidget
{
  List<CreditObject> _credits;
  @override
  Widget build(BuildContext context)
  {
    _credits = CreditObject.getCredits();

    return ListView.builder
    (
      itemCount: _credits.length,
      itemBuilder: (context,index)
      {
        return GestureDetector
          (
            child: Container
            (
              margin: EdgeInsets.fromLTRB(ConstantVariables.marginLeft,ConstantVariables.marginTop,ConstantVariables.marginRight,ConstantVariables.marginBottom),
              child: CreditsBox(credit: _credits[index])
            ),
            onTap:
            ()
            {
              Navigator.push
              (
                context,MaterialPageRoute(builder: (context) =>  BlueBackGroundWidget(insiderWidget: Browser(url: _credits[index].creatorLink),), ),
              );

            }
        );
      },
    );
  }

}

class CreditsBox extends StatelessWidget
{
  final CreditObject credit;

  CreditsBox({Key key,this.credit}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Container
    (
      padding: EdgeInsets.all(0),
      child: Column
        (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:
        <Widget>
        [
          Rower(credit.creator, "Creator: "),
          Rower(credit.icon, "Icon: "),
          Rower(credit.source, "Source site: "),
        ],
      ),
    );
  }

}

