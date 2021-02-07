import 'package:app_constants/ThemeConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'NotificationPage.dart';

List<dynamic> notifications;
class NotificationView extends StatefulWidget
{


  NotificationView(List<dynamic> notes)
  {
    notifications =notes;
  }

  @override
  _NotificationsState createState() => _NotificationsState();


}

class _NotificationsState extends State<NotificationView>
{

  @override
  Widget build(BuildContext context)
  {
    return ListView.builder
    (
      itemCount: notifications.length,
      itemBuilder: (context,index)
      {
        return GestureDetector
          (
            child:NoteBox(note: notifications[index]),
            onTap:
            ()
            {
              Navigator.push
                (
                context,MaterialPageRoute(builder: (context) => NotePage(note: notifications[index]),),
              );
            }
        );
      },
    );
  }
}
class NoteBox extends StatelessWidget
{
  NoteBox({Key key, this.note}) : super(key:key);
  final dynamic note;

  @override
  Widget build(BuildContext context)
  {
    return Container
      (
        padding: EdgeInsets.all(2),
        height:ConstantVariables.cardHeight,
        child:
        Card
          (
            child:
            Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                <Widget>
                [
                  Image.asset("assets/logo/zjgsu.png",width: ConstantVariables.noteImageWidth, height: ConstantVariables.noteImageHeight),
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
                                Text.rich(TextSpan(text: note.notificationName,style: TextStyle(fontFamily: "Poppins",color: ConstantVariables.headingTextColor)),textAlign: TextAlign.start,),
                                Text.rich(TextSpan(text: note.registeredDepartment.departmentName,style: TextStyle(fontFamily: "Poppins",color: ConstantVariables.headingTextColor)),textAlign: TextAlign.start,),
                              ]
                          )
                      )
                  )
                ]
            )
        )
    );
  }
}