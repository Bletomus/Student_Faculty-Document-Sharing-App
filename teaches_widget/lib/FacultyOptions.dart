
import 'package:app_constants/LoginInformation.dart';
import 'package:flutter/cupertino.dart';
import 'package:options_widget/OptionsList.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';
List<String> options =
[
  "Send Files to students",
  "Special Mentions",
  "About the School",
  "About the Responsible Department",
  "View Downloads"
];
class FacultyOptions extends StatelessWidget
{
  LoginVariables userCredentials;

  FacultyOptions(this.userCredentials);

  @override
  Widget build(BuildContext context)
  {
    return whiteBackGroundWidget(insiderWidget: Options.withUser(options,2,userCredentials),);
  }

}