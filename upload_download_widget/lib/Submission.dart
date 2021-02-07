import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/UploadList.dart';
import 'package:models/Teaches.dart';



class Submissions extends StatefulWidget
{
  final String location;
  final Teaches teaches;
  Submissions({Key key, this.teaches,this.location}) : super(key: key);
  @override
  _SubmissionState createState() => _SubmissionState();

}

class _SubmissionState extends State<Submissions>
{
  @override
  Widget build(BuildContext context)
  {
    debugPrint(widget.location);
    return Scaffold
    (
      appBar: AppBar(title: Text("Submissions")),
      body:GetUploadsWidget(location: widget.location,canDownload: true,),
    );
  }

}


