
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingCircle extends StatefulWidget
{
  @override
  _LoadingState createState() => _LoadingState();

}

class _LoadingState extends State<LoadingCircle>
{
  @override
  Widget build(BuildContext context)
  {
    return Center
    (
      child:Container
      (
        color: Colors.white,
        child:  CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),), //
      ),
    );
  }

}