import 'dart:async';


import 'package:models/Teaches.dart';
import 'package:networking/Response.dart';
import 'package:repository/TeachesRepository.dart';

class TeachesBloc
{
  TeachesRepository teachesRepository = null;
  StreamController teachesController = null;

  StreamSink<Response<dynamic>> get teachesSink => teachesController.sink;

  Stream<Response<dynamic>> get teachesStream => teachesController.stream;

  String userId;
  TeachesBloc(String userId)
  {
    teachesController = StreamController<Response<dynamic>>();
    teachesRepository = TeachesRepository();
    this.userId = userId;
    fetchResult();
  }

  fetchResult() async
  {
    teachesSink.add(Response.loading('Looking for Information!'));
    try
    {
      List<Teaches> teaches= await teachesRepository.fetchTeaches(userId);
      teachesSink.add(Response.completed(teaches));
    }
    catch (e)
    {
      teachesSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose()
  {
    teachesController?.close();
  }
}