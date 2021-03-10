import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:app_constants/ThemeConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marquee/marquee.dart';
import 'package:open_file/open_file.dart';

class DownloadFolder extends StatefulWidget
{
  @override
  _StateDownload createState() => _StateDownload();

}
final String portName ='downloaderPort';
class _StateDownload extends State<DownloadFolder>
{
  List<Map> downloadsListMaps= [];
  ReceivePort port = ReceivePort();
  @override
  void initState()
  {
    super.initState();
    task();
    bindBackgroundIsolate();
    FlutterDownloader.registerCallback(downloadCallback);
  }
  @override
  void dispose()
  {
    unbindBackgroundIsolate();
    super.dispose();
  }
  static void downloadCallback(String id, DownloadTaskStatus status, int progress)
  {
    final SendPort send = IsolateNameServer.lookupPortByName(portName);
    send.send([id, status, progress]);
  }

  void unbindBackgroundIsolate()
  {
    IsolateNameServer.removePortNameMapping('downloaderPort');
  }


  void bindBackgroundIsolate()
  {
    bool isSuccess = IsolateNameServer.registerPortWithName(port.sendPort, portName);
    if (!isSuccess)
    {
      unbindBackgroundIsolate();
      bindBackgroundIsolate();
      return;
    }
    port.listen
    (
      (dynamic data)
      {
        String id = data[0];
        DownloadTaskStatus status = data[1];
        int progress = data[2];
        var task = downloadsListMaps?.where((element) => element['id'] == id);
        task.forEach
        (
          (element)
          {
            element['progress'] = progress;
            element['status'] = status;
            setState(() {});
          }
        );
      }
    );
  }
  Future task() async {
    List<DownloadTask> getTasks = await FlutterDownloader.loadTasks();
    getTasks.forEach((_task)
    {
      Map map = Map();
      map['status'] = _task.status;
      map['progress'] = _task.progress;
      map['id'] = _task.taskId;
      map['filename'] = _task.filename;
      map['savedDirectory'] = _task.savedDir;
      downloadsListMaps.add(map);
    });
    setState(() {});
  }
  @override
  Widget build(BuildContext context)
  {
    return ListView.builder
    (
      itemCount:downloadsListMaps.length,
      itemBuilder: (context,index)
      {
        Map map = downloadsListMaps[index];
        String filename = map['filename'];
        int progress = map['progress'];
        DownloadTaskStatus _status = map['status'];
        String id = map['id'];
        String savedDirectory = map['savedDirectory'];
        List<FileSystemEntity> directories = Directory(savedDirectory).listSync(followLinks: true);
        File file = directories.isNotEmpty ? directories?.first : null;
        debugPrint(savedDirectory);

        return GestureDetector
        (
          child: Container
            (
            child: Card
              (
              child: Row
                (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children:
                <Widget>
                [
                  Align
                    (
                    alignment: Alignment.topLeft,
                    child:
                    SizedBox
                      (
                      width:100,
                      height:100,
                      child:SvgPicture.asset('assets/icons/document.svg'),
                    ),
                  ),
                  SizedBox
                  (
                    width:200,
                    height:200,
                    child: Marquee(text: filename + "      ",style:TextStyle(fontFamily: "Poppins",color: ConstantVariables.headingTextColor,fontSize: ConstantVariables.singleHeaderSize),),
                  ),


                ],
              ),
            ),
          ),
          onTap:
          ()
          async {
            if (_status == DownloadTaskStatus.complete)
            {
              await OpenFile.open(savedDirectory);
            }
          }
        );
      },
    );
  }

}