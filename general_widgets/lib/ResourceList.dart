import 'package:download_widget/Downloader.dart';
import 'package:flutter/cupertino.dart';
import 'package:models/Teaches.dart';
import 'package:models/Uploads.dart';

import 'UploadCard.dart';

class ResourceList extends StatelessWidget
{
  final String location;
  final List<Uploads> uploads;
  final bool canDownload;
  ResourceList({Key key,this.location,this.uploads,this.canDownload}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return ListView.builder
      (
      itemCount: uploads.length,
      itemBuilder: (context, index)
      {
        return GestureDetector
          (
            child: UploadCard(upload: uploads[index],),
            onTap:
                ()
            async
            {
              if(canDownload)
                await UploadDownloader.DownloadFile(uploads[index].fileName,uploads[index].id);
            }
        );
      },
    );
  }
}