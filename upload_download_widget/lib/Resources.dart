import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/UploadList.dart';
import 'package:models/Teaches.dart';
import 'package:general_widgets/UploadFunctions.dart';


class Resources extends StatefulWidget
{
  final String location;
  final Teaches teaches;
  Resources({Key key, this.teaches,this.location}) : super(key: key);

  @override
  _ResourceState createState() => _ResourceState(teaches,location);

}

class _ResourceState extends State<Resources>
{
  Teaches teaches;
  String location;
  _ResourceState(this.teaches,this.location);

  @override
  Widget build(BuildContext context)
  {
    debugPrint(widget.location);
    return Scaffold
    (
      appBar: AppBar(title: Text("Resources")),
      body:GetUploadsWidget(location: location,canDownload: true,),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton.extended
      (
        label:Text("Upload file"),
        icon: Icon(Icons.add),
        onPressed:
        ()
        async
        {
          await findUpload(context,teaches.teacher.id,1);
        },
      ),
    );
  }

}



