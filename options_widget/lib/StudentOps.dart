
import 'package:download_widget/DownloadFolder.dart';
import 'package:flutter/cupertino.dart';
import 'package:options_widget/AboutDepartment.dart';
import 'package:options_widget/AboutSchool.dart';
import 'package:options_widget/SpecialMentions.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';
int index;

class StudentOps extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {

    if(index == 0)
    {
      return whiteBackGroundWidget(insiderWidget: SpecialMentions(),);
    }
    if(index == 1)
    {
      return AboutSchool();
    }
    if(index == 2)
      return AboutDepartment();
    else
      return DownloadFolder();
  }

  StudentOps(int i)
  {
    index = i;
  }
}
