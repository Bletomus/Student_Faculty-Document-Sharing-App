import 'package:app_constants/ThemeConstants.dart';
import 'package:course_info_widgets/CoursePicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> fieldItems;
List<String> valueItems;
int _type = 1;
class CourseListBox extends StatelessWidget
{
  final List<dynamic> courses;
  final int type;
  CourseListBox({Key key, this.courses,this.type}) : super(key:key);

  @override
  Widget build(BuildContext context)
  {
    _type = type;
    return ListView.builder
    (
      itemCount: courses.length,
      itemBuilder: (context,index)
      {
        return CourseBox(course: courses[index],);
      },
    );
  }


}

class CourseBox extends StatelessWidget
{
  final dynamic course;
  CourseBox({Key key, this.course}) : super(key:key);
  List<Widget> rows()
  {
    List<Widget> _rows = [];
    for(var index = 0;index < fieldItems.length;index++)
    {
      _rows.add(RowWidget(heading: fieldItems[index],value: valueItems[index],));
    }
    return _rows;
  }
  @override
  Widget build(BuildContext context)
  {
    CoursePicker coursePicker = CoursePicker(_type, course);
    fieldItems=coursePicker.getFields();
    valueItems=coursePicker.getValues();
    return Container
      (
      //padding: EdgeInsets.all(2),
      //height:120,

      child:Card
        (

        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: rows(),
        ),
        /*Row
          (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>
          [
            SizedBox
              (
                width: ConstantVariables.boxWidth,
                height: ConstantVariables.boxHeight,
                child: ListHeadings()
            ),
            Expanded(child: ListContent()),
          ],
        ),

         */
      ),
    );
  }
}

class RowWidget extends StatelessWidget
{
  final String heading;
  final String value;
  RowWidget({Key key, this.heading,this.value}) : super(key:key);

  @override
  Widget build(BuildContext context)
  {
    return Row
    (
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>
      [
        SizedBox
        (
          width: ConstantVariables.boxWidth,
          height: ConstantVariables.boxHeight,
          child:Align
          (
            alignment: Alignment.topLeft,
            child: Text.rich(TextSpan(text: heading,style: TextStyle(color: ConstantVariables.headingTextColor,fontSize: ConstantVariables.fieldHeaderTextSize,fontFamily: "Poppins"),),textAlign: TextAlign.start,),
          ),
        ),
        Align
        (
          alignment: Alignment.topRight,
          child:Text.rich(TextSpan(text: value,style: TextStyle(color: ConstantVariables.fieldTextColor,fontSize: ConstantVariables.fieldTextSize,fontFamily: "Poppins",fontWeight: FontWeight.bold),),textAlign: TextAlign.end,),
        ),
      ],
    );
  }

}

/*

class ListHeadings extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Align
      (
      alignment: Alignment.topLeft,
      child: ListView.builder
        (
        shrinkWrap: true,
        itemCount: fieldItems.length,
        itemBuilder: (context,index)
        {
          return Text.rich(TextSpan(text: fieldItems[index],style: TextStyle(color: ConstantVariables.headingTextColor,fontSize: ConstantVariables.fieldHeaderTextSize,fontFamily: "Poppins"),),textAlign: TextAlign.start,);
        },
      ),
    );
  }

}

class ListContent extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Align
      (
      alignment: Alignment.topRight,
      child: ListView.builder
        (
        shrinkWrap: true,
        itemCount: fieldItems.length,
        itemBuilder: (context,index)
        {
          return Text.rich(TextSpan(text: valueItems[index],style: TextStyle(color: ConstantVariables.fieldTextColor,fontSize: ConstantVariables.fieldTextSize,fontFamily: "Poppins",fontWeight: FontWeight.bold),),textAlign: TextAlign.end,);
        },
      ),
    );
  }
}
*/
