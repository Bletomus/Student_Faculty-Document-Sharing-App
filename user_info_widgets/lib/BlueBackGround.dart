import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlueBackGroundWidget extends StatefulWidget
{
  BlueBackGroundWidget({Key key, this.insiderWidget}) : super(key: key);
  Widget insiderWidget;
  @override
  _BlueBackGroundState createState() => _BlueBackGroundState(insiderWidget);

}

class _BlueBackGroundState extends State<BlueBackGroundWidget>
{
  Widget insiderWidget;

  _BlueBackGroundState(this.insiderWidget);

  @override
  Widget build(BuildContext context)
  {
    return SizedBox.expand
      (
      child:Container
        (
        color: Colors.blue[400],
        child: insiderWidget,
      ),
    );
  }

}