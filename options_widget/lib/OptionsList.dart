
import 'package:app_constants/LoginInformation.dart';
import 'package:app_constants/ThemeConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:options_widget/FacultyOps.dart';
import 'package:options_widget/StudentOps.dart';
List<String> _options;
int _type;
LoginVariables _userCredentials;

BoxDecoration border()
{
  return BoxDecoration
    (
    border: Border
      (
      bottom: BorderSide
        (
        color: ConstantVariables.optionsBottomBorderColor,
        width: ConstantVariables.optionsBottomBorderwidth,
      ),
    ),
  );
}

class Options extends StatelessWidget
{

  Options(List<String> option,int types)
  {
    _options = option;
    _type = types;
  }

  Options.withUser(List<String> option,int types, LoginVariables loginVariables)
  {
    _options = option;
    _type = types;
    _userCredentials =loginVariables;
  }
  @override
  Widget build(BuildContext context)
  {
    return ListView.builder
    (
      itemCount: _options.length,
      itemBuilder: (context,index)
      {
        return GestureDetector
          (
            child: Container
            (
              decoration: border(),
              margin: EdgeInsets.fromLTRB(ConstantVariables.marginLeft,ConstantVariables.marginTop,ConstantVariables.marginRight,ConstantVariables.marginBottom),
              child: Text.rich(TextSpan(text: _options[index],style: TextStyle(fontSize: ConstantVariables.singleHeaderSize,fontFamily: "Poppins",color: ConstantVariables.headingTextColor)),textAlign: TextAlign.start,),
            ),
            onTap:
            ()
            {
              if(_type == 1)
              {
                Navigator.push
                (
                  context,MaterialPageRoute(builder: (context) => StudentOps(index: index),),
                );
              }
              else
              {
                Navigator.push
                (
                  context,MaterialPageRoute(builder: (context) => FacultyOps(index: index,userCredentials: _userCredentials),),
                );
              }
            }
        );
      },
    );
  }
}

