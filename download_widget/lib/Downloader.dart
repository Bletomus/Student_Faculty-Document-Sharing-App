import 'package:download_widget/download_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:networking/ApiConstants.dart';

class UploadDownloader
{

  static Future<void> DownloadFile(String folder,String id) async
  {
    debugPrint(ApiConstants(1).downloadEndPoint()+ id);
    await RunDownload.downloadFile(ApiConstants(1).downloadEndPoint()+ id, folder);
  }
  static Future<void> DownloadNoteFile(String folder,String id) async
  {
    debugPrint(ApiConstants(1).downloadNoteEndPoint()+ id);
    await RunDownload.downloadFile(ApiConstants(1).downloadNoteEndPoint()+ id, folder);
  }
}