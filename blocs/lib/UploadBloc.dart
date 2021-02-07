import 'dart:async';

import 'package:models/Uploads.dart';
import 'package:networking/Response.dart';
import 'package:repository/UploadRepository.dart';

class UploadBloc
{
  UploadRepository uploadRepository = null;
  StreamController uploadController = null;

  StreamSink<Response<dynamic>> get uploadSink => uploadController.sink;

  Stream<Response<dynamic>> get uploadStream => uploadController.stream;

  String location;
  UploadBloc(String location)
  {
    uploadController = StreamController<Response<dynamic>>();
    uploadRepository = UploadRepository();
    this.location = location;
    fetchResult();
  }

  fetchResult() async
  {
    uploadSink.add(Response.loading('Looking for Information!'));
    try
    {
      List<Uploads> uploads= await uploadRepository.fetchUploads(location);
      uploadSink.add(Response.completed(uploads));
    }
    catch (e)
    {
      uploadSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose()
  {
    uploadController?.close();
  }
}