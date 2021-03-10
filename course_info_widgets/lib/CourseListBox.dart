import 'package:app_constants/ThemeConstants.dart';
import 'package:course_info_widgets/CoursePicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class CourseListBox extends StatelessWidget
{
  final List<dynamic> courses;
  final int type;
  CourseListBox({Key key, this.courses,this.type}) : super(key:key);

  @override
  Widget build(BuildContext context)
  {
    return ListView.builder
    (
      itemCount: courses.length,
      itemBuilder: (context,index)
      {
        return CourseBox(course: courses[index],type: type,);
      },
    );
  }


}

class CourseBox extends StatelessWidget
{
  final dynamic course;
  final int type;
  CourseBox({Key key, this.course,this.type}) : super(key:key);

  List<Widget> rows(List<String> _fieldItems, List<String> _valueItems)
  {
    List<Widget> _rows = [];
    for(var index = 0;index < _fieldItems.length;index++)
    {
      _rows.add(RowWidget(heading: _fieldItems[index],value: _valueItems[index],));
    }
    return _rows;
  }
  @override
  Widget build(BuildContext context)
  {
    List<String> _fieldItems;
    List<String> _valueItems;
    CoursePicker coursePicker = CoursePicker(type , course);
    _fieldItems=coursePicker.getFields();
    _valueItems=coursePicker.getValues();
    return Container
    (
      child:Card
        (

        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: rows(_fieldItems, _valueItems),
        ),

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
          child:Text.rich(TextSpan(text: value,style: TextStyle(color: ConstantVariables.fieldTextColor,fontSize: ConstantVariables.fieldTextSize,fontFamily: "Poppins",fontWeight: FontWeight.bold),)),
        ),
      ],
    );
  }

}

