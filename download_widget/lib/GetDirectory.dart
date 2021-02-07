import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
class GetDirectory
{
  static Future<Map<String,dynamic>> requestDownloadDirectory(String name) async
  {
    final dir =  await getExternalStorageDirectory();
    var localPath = dir.path + Platform.pathSeparator + 'SFDSS Download';
    final savedDir = Directory(localPath);
    Map<String, dynamic> items = {};
    items["loci"] = localPath;
    items["savedDir"] = savedDir;
    debugPrint(localPath);
    return items;
  }
}

