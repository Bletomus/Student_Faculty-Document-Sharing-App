import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

class StartDownload
{
  static Future<String> startDownload(String url, String name,String localPath, Directory savedDir) async
  {
    String task;
    bool hasExisted = await savedDir.exists();
    if (!hasExisted)
    {
      savedDir.create();
    }

    String taskid = await FlutterDownloader.enqueue(
      url: url,
      fileName: name,
      savedDir: localPath,
      showNotification: true,
      openFileFromNotification: true,
    );
    task = taskid;
    debugPrint(taskid);

    return task;
  }

}