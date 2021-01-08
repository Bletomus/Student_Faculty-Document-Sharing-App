
import 'dart:async';

import 'package:models/StudentScores.dart';
import 'package:networking/Response.dart';
import 'package:repository/StudentScoresRepository.dart';

class StudentScoresBlocs
{
  StudentScoresRepository studentScoresRepository = null;
  StreamController scoresController = null;

  StreamSink<Response<dynamic>> get scoresSink => scoresController.sink;

  Stream<Response<dynamic>> get scoresStream => scoresController.stream;

  String userId;
  StudentScoresBlocs(String userId)
  {
    scoresController = StreamController<Response<dynamic>>();
    studentScoresRepository = StudentScoresRepository();
    this.userId = userId;
    fetchResult();
  }

  fetchResult() async
  {
    scoresSink.add(Response.loading('Looking for Information!'));
    try
    {
      List<StudentScores> studentScores= await studentScoresRepository.fetchUserScores(userId);
      scoresSink.add(Response.completed(studentScores));
    }
    catch (e)
    {
      scoresSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose()
  {
    scoresController?.close();
  }
}