import 'package:app_constants/LoginInformation.dart';
import 'package:blocs/TeachesBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/DialogBox.dart';
import 'package:general_widgets/LoadingWidgets.dart';
import 'package:models/Teaches.dart';
import 'package:networking/Response.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';
import 'package:view/FacultyHome.dart';
import 'package:view/SubmitForm.dart';

import 'Departments.dart';


class FacultyRAndA extends StatefulWidget
{
  FacultyRAndA({Key key, this.userCredentials}) : super(key: key);
  final LoginVariables userCredentials;

  @override
  FacultyState createState() => FacultyState();


}
class FacultyState extends State<FacultyRAndA>
{
  TeachesBloc teachesBloc;
  @override
  void initState()
  {
    super.initState();
    teachesBloc = TeachesBloc(widget.userCredentials.user_id);
  }
  @override
  Widget build(BuildContext context)
  {
    return StreamBuilder<Response<dynamic>>
      (
      stream: teachesBloc.teachesStream,
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
              return Departments(teaches: snapshot.data.data,);
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
          return FacultyHome(userCredentials: widget.userCredentials,);

        return whiteBackGroundWidget(insiderWidget: LoadingCircle(),);
      },
    );

  }
}

