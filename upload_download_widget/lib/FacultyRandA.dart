import 'package:app_constants/LoginInformation.dart';
import 'package:blocs/TeachesBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/LoadingWidgets.dart';
import 'package:models/Teaches.dart';
import 'package:networking/Response.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';

import 'Departments.dart';
LoginVariables userCredentials;
List<Teaches> students ;
class FacultyRAndA extends StatefulWidget
{

  FacultyRAndA(LoginVariables loginVariables)
  {
    userCredentials = loginVariables;
  }

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
    teachesBloc = TeachesBloc(userCredentials.user_id);
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
              students = snapshot.data.data;
              return Departments(teaches: students,);
              break;
            default:
              return Text("There seems to be a problem with the connection!",style: TextStyle(color: Colors.black, fontSize: 24,),);
              break;
          }
        }
        else
          return Text("error");
      },
    );

  }
}

