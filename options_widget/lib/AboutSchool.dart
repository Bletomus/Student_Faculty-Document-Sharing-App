import 'package:app_constants/ThemeConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:user_info_widgets/BlueBackGround.dart';

import 'InAppBrowser.dart';

class AboutSchool extends StatefulWidget
{
  @override
  SchoolState createState() => SchoolState();

}

class SchoolState extends State<AboutSchool>
{
  @override
  Widget build(BuildContext context)
  {
    return BlueBackGroundWidget(insiderWidget: Browser(url: ConstantVariables.urlAboutSchool,),);
  }

}