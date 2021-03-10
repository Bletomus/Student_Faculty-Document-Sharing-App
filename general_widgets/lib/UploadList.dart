import 'package:blocs/UploadBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/NoConnection.dart';
import 'package:models/Uploads.dart';
import 'package:networking/Response.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';
import 'package:view/SubmitForm.dart';

import 'DialogBox.dart';
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
              return whiteBackGroundWidget(insiderWidget: LoadingCircle(),);
              break;
            case Status.COMPLETED:
              uploads = snapshot.data.data;
              return ResourceList(location: widget.location,uploads: uploads,canDownload: widget.canDownload);
              break;
            default:
              WidgetsBinding.instance.addPostFrameCallback
                (
                      (_)
                  {
                    DialogBox.showMessage(context, "Error Loading", "There seems to be a problem with the connection!! Please verify connection and try again");
                  }
              );
              break;

          }
        }
        else
          return whiteBackGroundWidget(insiderWidget: LoadingCircle(),);

        return whiteBackGroundWidget(insiderWidget: LoadingCircle(),);

      },
    );
  }

}