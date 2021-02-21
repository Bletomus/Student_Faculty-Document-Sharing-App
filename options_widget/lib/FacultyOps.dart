import 'package:app_constants/LoginInformation.dart';
import 'package:download_widget/DownloadFolder.dart';
import 'package:flutter/cupertino.dart';
import 'package:options_widget/AboutDepartment.dart';
import 'package:options_widget/AboutSchool.dart';
import 'package:options_widget/SendFiles.dart';
import 'package:options_widget/SpecialMentions.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';


class FacultyOps extends StatelessWidget
{

  FacultyOps({Key key,this.userCredentials,this.index}) : super(key: key);
  final LoginVariables userCredentials;
  final int index;

  @override
  Widget build(BuildContext context)
  {
    if(index == 0)
    {
      return SendFiles(userCredentials: userCredentials);
    }
    if(index == 1)
    {
      return whiteBackGroundWidget(insiderWidget: SpecialMentions(),);
    }
    if(index == 2)
      return AboutSchool();
    if(index == 3)
      return AboutDepartment();
    else
      return DownloadFolder();
  }

}