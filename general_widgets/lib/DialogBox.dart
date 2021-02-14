import 'package:flutter/material.dart';
class DialogBox
{
  static void showMessage(BuildContext context,String heading,String content)
  {
    showDialog
      (
      context: context, builder: (BuildContext context,)
    {
      return AlertDialog
        (
        title: Text(heading),
        content: Text(content),
        actions:
        <Widget>
        [
          TextButton
            (
            child: Text("Close"),
            onPressed:()
            {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
    );
  }
}

/*class DialogWidget extends StatelessWidget
{
  final String title;
  final String content;
  DialogWidget({Key key, this.title,this.content}) : super (key:key);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar:AppBar(title: Text(title)) ,
      body:
    );
  }

}

 */