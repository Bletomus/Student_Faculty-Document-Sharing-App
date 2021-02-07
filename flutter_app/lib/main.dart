
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:view/SubmitForm.dart';

Future main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    WidgetsFlutterBinding.ensureInitialized();
    return MaterialApp(title: ' Campus Document Sharing System',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: SubmitForm(),
    );
  }
}

