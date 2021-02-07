import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/UploadFunctions.dart';
import 'package:general_widgets/UploadList.dart';

class Submissions extends StatefulWidget
{
  final String location;
  final String personID;
  Submissions({Key key, this.personID,this.location}) : super(key: key);
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
      body:GetUploadsWidget(location: widget.location,canDownload: false,),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton.extended
        (
        label:Text("Upload file"),
        icon: Icon(Icons.add),
        onPressed:
            ()
        async
        {
          await findUpload(context,widget.personID,2);
        },
      ),
    );
  }

}