import 'package:blocs/UploadBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:models/Uploads.dart';
import 'package:networking/Response.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';

import 'LoadingWidgets.dart';
import 'ResourceList.dart';

class GetUploadsWidget extends StatefulWidget
{
  final String location;
  final bool canDownload;
  GetUploadsWidget({Key key,this.location,this.canDownload}) : super(key: key);

  @override
  _GetWidgetState createState() => _GetWidgetState();

}

class _GetWidgetState extends State<GetUploadsWidget>
{

  UploadBloc uploadBloc ;

  @override
  void initState()
  {
    super.initState();
    uploadBloc = UploadBloc(widget.location);
  }


  @override
  Widget build(BuildContext context)
  {
    debugPrint(widget.location);
    List<Uploads> uploads = [];
    return StreamBuilder<Response<dynamic>>
      (
      stream: uploadBloc.uploadStream,
      builder: (context,snapshot)
      {
        if (snapshot.hasData)
        {
          switch (snapshot.data.status)
          {
            case Status.LOADING:

              break;
            case Status.COMPLETED:
              uploads = snapshot.data.data;
              return ResourceList(location: widget.location,uploads: uploads,canDownload: widget.canDownload);
              break;
            default:
              return whiteBackGroundWidget(insiderWidget: Text("There seems to be a problem with the connection!",style: TextStyle(color: Colors.black, fontSize: 24,),),);
              break;
          }
        }


        return whiteBackGroundWidget(insiderWidget: LoadingCircle(),);

      },
    );
  }

}