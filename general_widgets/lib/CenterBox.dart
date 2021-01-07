import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:app_constants/ThemeConstants.dart';
import 'CenterOptions.dart';

class CenterBoxWidget extends StatelessWidget
{
  CenterOptions item;

  CenterBoxWidget(this.item);

  @override
  Widget build(BuildContext context)
  {
    return Container
      (
      padding: EdgeInsets.all(2),
      child: Card
        (
        child: Column
          (
          children: <Widget>
          [
            Expanded
              (
              child: SvgPicture.asset(item.image),
            ),
            Text.rich(TextSpan(text: item.option,style: TextStyle(fontFamily: "Poppins",color: ConstantVariables.headingTextColor)),textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }


}