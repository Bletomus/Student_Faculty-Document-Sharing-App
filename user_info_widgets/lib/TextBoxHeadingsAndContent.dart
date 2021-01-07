import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_constants/ThemeConstants.dart';

import 'WhiteBackGround.dart';

BoxDecoration border()
{
  return BoxDecoration
    (
    border: Border
      (
      bottom: BorderSide
        (
        color: ConstantVariables.borderColor,
        width: ConstantVariables.bottomBorderSize,
      ),
    ),
  );
}

String getContacts(List<int> contacts)
{
  String finalText = "";
  for(var contact in contacts)
  {
    finalText = finalText + contact.toString() + ", ";
  }
  return finalText;
}

class HeadingsandContentWidget extends StatelessWidget
{
  List<String> content;
  List<String> headings;

  HeadingsandContentWidget({Key key, this.content,this.headings}) : super(key: key);

  ListView ContentList()
  {
    return ListView.builder
    (
      itemCount: content.length,
      itemBuilder: (context,index)
      {
        return Container
          (
          padding: EdgeInsets.all(2),
          child:Column
            (
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>
            [
              Container
                (
                decoration: border(),
                margin: EdgeInsets.fromLTRB(ConstantVariables.marginLeft,ConstantVariables.marginTop,ConstantVariables.marginRight,ConstantVariables.marginBottom),
                child: TextHeadings(headings[index]),
              ),
              TextContent(content[index]),
            ],
          ),
        );
      }
      ,
    );
  }
  @override
  Widget build(BuildContext context)
  {
    return whiteBackGroundWidget(insiderWidget: ContentList(),);
  }

}


class TextHeadings extends StatelessWidget
{
  String text;

  TextHeadings(this.text);

  @override
  Widget build(BuildContext context)
  {
    return Align
      (
      alignment: Alignment.topLeft,
      child: Text.rich(TextSpan(text: text, style: TextStyle(color : ConstantVariables.headingTextColor,fontSize:ConstantVariables.headingTextSize,fontFamily: "Poppins")),textAlign: TextAlign.start),
    );
  }

}

class TextContent extends StatelessWidget
{
  String text;

  TextContent(this.text);

  @override
  Widget build(BuildContext context)
  {
    return Align
      (
      alignment: Alignment.topLeft,
      child: Text.rich(TextSpan(text:text, style: TextStyle(fontFamily: "Poppins",color: ConstantVariables.generalTextColor,fontSize: ConstantVariables.generalTextSize),),textAlign: TextAlign.start),
    );
  }

}
