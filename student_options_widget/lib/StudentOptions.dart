import 'package:flutter/cupertino.dart';
import 'package:options_widget/OptionsList.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';

List<String> options =
[
  "Special Mentions",
  "About the School",
  "About the Responsible Department",
  "View Downloads"
];
class StudentOptions extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {

    return whiteBackGroundWidget(insiderWidget: Options(options,1),);
  }

}