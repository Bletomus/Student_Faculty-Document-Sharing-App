import 'package:flutter/material.dart';
import 'package:view/SubmitForm.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(title: ' Campus Document Sharing System',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: SubmitForm(),
    );
  }
}

