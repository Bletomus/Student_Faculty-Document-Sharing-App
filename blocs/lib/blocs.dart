library blocs;

import 'dart:async';

import 'package:repository/ExistenceRepository.dart';
import 'package:networking/Response.dart';

class ExistenceBloc
{
  ExistenceRepository existenceRepository = null;
  StreamController existenceController = null;

  StreamSink<Response<bool>> get isAvailableSink => existenceController.sink;

  Stream<Response<bool>> get isAvailableStream => existenceController.stream;
  String userId;

  ExistenceBloc(int choice, String userId)
  {
    existenceController = StreamController<Response<bool>>();
    existenceRepository = ExistenceRepository(choice);
    this.userId = userId;
    fetchResult();
  }

  fetchResult() async
  {
    isAvailableSink.add(Response.loading('Looking for user identification!'));
    try
    {
      bool isThere = await existenceRepository.fetchisAvaible(userId);
      isAvailableSink.add(Response.completed(isThere));
    }
    catch (e)
    {
      isAvailableSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose()
  {
    existenceController?.close();
  }
}