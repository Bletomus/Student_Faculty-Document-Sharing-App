import 'package:app_constants/ThemeConstants.dart';
import 'package:flutter/cupertino.dart';


import 'UploadFunctions.dart';

class Rower extends StatelessWidget
{
  String _value;

  String _key;

  Rower(this._value, this._key);

  @override
  Widget build(BuildContext context)
  {
    return Container
      (
      padding: EdgeInsets.all(5),
      child: Row
        (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:<Widget>
        [
          Text.rich(TextSpan(text: _key,style: TextStyle(fontFamily: "Poppins",color: ConstantVariables.headingTextColor)),textAlign: TextAlign.start,),
          Text.rich(TextSpan(text: _value,style:TextStyle(fontFamily: "Poppins",color: ConstantVariables.headingTextColor,)),textAlign: TextAlign.end,),
        ],
      ),
    );
  }

}