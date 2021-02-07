import 'package:app_constants/ThemeConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:options_widget/InAppBrowser.dart';
import 'package:user_info_widgets/BlueBackGround.dart';

class AboutDepartment extends StatefulWidget
{
  @override
  _DepartmentState createState() => _DepartmentState();

}

class _DepartmentState extends State<AboutDepartment>
{
  @override
  Widget build(BuildContext context)
  {
    return BlueBackGroundWidget(insiderWidget: Browser(url: ConstantVariables.urlAboutDepartment,),);
  }

}