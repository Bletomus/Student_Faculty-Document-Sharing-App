
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class whiteBackGroundWidget extends StatefulWidget
{
  whiteBackGroundWidget({Key key, this.insiderWidget}) : super(key: key);
  Widget insiderWidget;
  @override
  _WhiteBackGroundState createState() => _WhiteBackGroundState(insiderWidget);

}

class _WhiteBackGroundState extends State<whiteBackGroundWidget>
{
  Widget insiderWidget;

  _WhiteBackGroundState(this.insiderWidget);

  @override
  Widget build(BuildContext context)
  {
    return SizedBox.expand
    (
        child:Container
        (
          color: Colors.white,
          child: insiderWidget,
        ),
    );
  }

}