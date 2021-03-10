import 'package:app_constants/LoginInformation.dart';
import 'package:blocs/StudentNotificationsBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/DialogBox.dart';
import 'package:general_widgets/LoadingWidgets.dart';
import 'package:general_widgets/NotificationView.dart';
import 'package:networking/Response.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';
import 'package:view/StudentHome.dart';
import 'package:view/SubmitForm.dart';



class StudentNotificationsPage extends StatefulWidget
{
  final LoginVariables userCredentials;
  StudentNotificationsPage({Key key,this.userCredentials}) : super(key: key);

  @override
  _StudentNotificationsState createState() => _StudentNotificationsState();

}
class _StudentNotificationsState extends State<StudentNotificationsPage>
{
  StudentNotificationsBloc studentNotificationsBloc;
  List<dynamic> notes;
  @override
  void initState()
  {
    super.initState();
    studentNotificationsBloc = StudentNotificationsBloc(widget.userCredentials.user_id);
  }
  @override
  Widget build(BuildContext context)
  {
    return StreamBuilder<Response<dynamic>>
      (
      stream: studentNotificationsBloc.notificationStream,
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
              notes = snapshot.data.data;
              return NotificationView(note: notes);
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
          return StudentHome(userCredentials: widget.userCredentials);
        }
        return whiteBackGroundWidget(insiderWidget: LoadingCircle(),);

      },
    );
  }


}