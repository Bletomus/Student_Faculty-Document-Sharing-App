import 'package:app_constants/ThemeConstants.dart';
import 'package:download_widget/Downloader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';

class NotePage extends StatefulWidget
{
  final dynamic note;

  NotePage({Key key,this.note}) : super(key: key);
  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<NotePage>
{
  @override
  Widget build(BuildContext context)
  {
    return whiteBackGroundWidget(insiderWidget:
      Center
      (
        child: Container
        (
          padding: EdgeInsets.all(0),
          child: Align
          (
            alignment: Alignment.center,
            child: Column
            (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
              <Widget>
              [
                Image.asset("assets/logo/" + ConstantVariables.logo,width: 100, height: 100),
                Expanded
                  (
                    child:
                    Container
                      (
                        padding: EdgeInsets.all(5),
                        child: Column
                        (
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:<Widget>
                          [
                            Text.rich(TextSpan(text: widget.note.notificationName,style: TextStyle(fontFamily: "Poppins",color: ConstantVariables.headingTextColor)),textAlign: TextAlign.center,),
                            Text.rich(TextSpan(text: widget.note.registeredDepartment.departmentName,style: TextStyle(fontFamily: "Poppins",color: ConstantVariables.headingTextColor)),textAlign: TextAlign.center,),
                            Text.rich(TextSpan(text: widget.note.notification,style: TextStyle(fontFamily: "Poppins",color: ConstantVariables.headingTextColor)),textAlign: TextAlign.center,),
                            RaisedButton
                            (
                              textColor: Colors.white,
                              color: Colors.blueAccent,
                              child: Text.rich(TextSpan(text: "Download Attached File", style: TextStyle(fontFamily: "Poppins"))),
                              onPressed:
                              ()
                              async {
                                if(widget.note.hasUpload == true)
                                  await UploadDownloader.DownloadFile(widget.note.upload.fileName ,widget.note.upload.id);

                              },
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),),
                            ),
                          ]
                      )
                  )
              )
            ],
          ),
        ),
      ),
    ),
  );
  }

}