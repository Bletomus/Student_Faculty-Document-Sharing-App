import 'package:app_constants/ThemeConstants.dart';
import 'package:flutter/cupertino.dart';

class Rower extends StatelessWidget
{
  String value;

  String _key;

  Rower(this.value, this._key);

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
          Text.rich(TextSpan(text: value,style: TextStyle(fontFamily: "Poppins",color: ConstantVariables.headingTextColor)),textAlign: TextAlign.end,),
        ],
      ),
    );
  }

}