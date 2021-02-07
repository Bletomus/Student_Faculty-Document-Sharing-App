import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/UploadList.dart';
import 'package:models/Teaches.dart';
import 'package:general_widgets/UploadFunctions.dart';

class Assignments extends StatefulWidget
{
  final String location;
  final Teaches teaches;
  Assignments({Key key, this.teaches,this.location}) : super(key: key);
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton.extended
        (
        label:Text("Upload file"),
        icon: Icon(Icons.add),
        onPressed:
            ()
        async
        {
          await findUpload(context,widget.teaches.teacher.id,0);
        },
      ),
    );
  }

}


