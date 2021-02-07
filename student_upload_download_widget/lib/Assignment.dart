import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/UploadFunctions.dart';
import 'package:general_widgets/UploadList.dart';

class Assignments extends StatefulWidget
{
  final String location;
  Assignments({Key key, this.location}) : super(key: key);
  @override
  _AssignmentState createState() => _AssignmentState();

}

class _AssignmentState extends State<Assignments>
{
  @override
  Widget build(BuildContext context)
  {
    debugPrint(widget.location);
    return Scaffold
    (

      appBar: AppBar(title: Text("Assignments")),
      body:GetUploadsWidget(location: widget.location,canDownload: true,),
    );
  }

}