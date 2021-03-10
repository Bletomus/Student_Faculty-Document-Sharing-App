import 'package:app_constants/LoginInformation.dart';
import 'package:blocs/FacultyNotificationsBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/DialogBox.dart';
import 'package:general_widgets/LoadingWidgets.dart';
import 'package:general_widgets/NotificationView.dart';
import 'package:networking/Response.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';
import 'package:view/FacultyHome.dart';
import 'package:view/SubmitForm.dart';



class FacultyNotificationsPage extends StatefulWidget
{
  FacultyNotificationsPage({Key key,this.userCredentials}) : super(key: key);
  final LoginVariables userCredentials;
  @override
  _FacultyNotificationsState createState() => _FacultyNotificationsState();

}

class _FacultyNotificationsState extends State<FacultyNotificationsPage>
{
  FacultyNotificationsBloc facultyNotificationsBloc;
  @override
  void initState()
  {
    super.initState();
    facultyNotificationsBloc = FacultyNotificationsBloc(widget.userCredentials.user_id);
  }
  @override
  Widget build(BuildContext context)
  {
    return StreamBuilder<Response<dynamic>>
      (
      stream: facultyNotificationsBloc.notificationStream,
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

              return NotificationView(note: snapshot.data.data);
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
        {
          return FacultyHome(userCredentials: widget.userCredentials,);
        }
        return whiteBackGroundWidget(insiderWidget: LoadingCircle(),);

      },
    );
  }


}