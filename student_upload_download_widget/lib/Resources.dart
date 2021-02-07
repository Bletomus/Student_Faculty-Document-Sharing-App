import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/UploadFunctions.dart';
import 'package:general_widgets/UploadList.dart';
import 'package:models/StudentTakes.dart';

class Resources extends StatefulWidget
{
  final String location;
  final String personID;
  Resources({Key key, this.personID,this.location}) : super(key: key);

  @override
  _ResourceState createState() => _ResourceState();

}

class _ResourceState extends State<Resources>
{
  @override
  Widget build(BuildContext context)
  {
    debugPrint(widget.location);
    return Scaffold
    (
      appBar: AppBar(title: Text("Resources")),
      body:GetUploadsWidget(location: widget.location,canDownload: true,),
    );
  }

}


