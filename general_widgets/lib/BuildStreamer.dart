
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:networking/Response.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';

import 'LoadingWidgets.dart';


class BuildStreamer extends StatefulWidget
{
  Widget innerWidget;
  dynamic bloc;
  BuildStreamer({Key key, this.innerWidget,this.bloc}) : super(key: key);
  @override
  _StreamerState createState() => _StreamerState(innerWidget,bloc);

}
class _StreamerState extends State<BuildStreamer>
{
  dynamic data;
  dynamic getData;
  Widget innerWidget;
  dynamic bloc;
  _StreamerState(this.innerWidget,this.bloc);

  @override
  Widget build(BuildContext context)
  {
    return StreamBuilder<Response<dynamic>>
      (
      stream: bloc.infoStream,
      builder: (context,snapshot)
      {
        if (snapshot.hasData)
        {
          switch (snapshot.data.status)
          {
            case Status.LOADING:

              break;
            case Status.COMPLETED:
              getData = snapshot.data.data;
              return innerWidget;
              break;
            default:
              return Text("There seems to be a problem with the connection!",style: TextStyle(color: Colors.black, fontSize: 24,),);
              break;
          }
        }


        return whiteBackGroundWidget(insiderWidget: LoadingCircle(),);

      },
    );
  }
}