import 'package:app_constants/LoginInformation.dart';
import 'package:blocs/FacultyNotificationsBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/LoadingWidgets.dart';
import 'package:general_widgets/NotificationView.dart';
import 'package:networking/Response.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';

LoginVariables userCredentials;
List<dynamic> notes;
class FacultyNotificationsPage extends StatefulWidget
{
  @override
  _FacultyNotificationsState createState() => _FacultyNotificationsState();
  FacultyNotificationsPage(LoginVariables user)
  {
    userCredentials=user;
  }
}
class _FacultyNotificationsState extends State<FacultyNotificationsPage>
{
  FacultyNotificationsBloc facultyNotificationsBloc;
  @override
  void initState()
  {
    facultyNotificationsBloc = FacultyNotificationsBloc(userCredentials.user_id);
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

              break;
            case Status.COMPLETED:
              notes = snapshot.data.data;
              return NotificationView(notes);
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