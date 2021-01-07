import 'package:app_constants/LoginInformation.dart';
import 'package:blocs/UserInfoBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:models/TeacherInfo.dart';
import 'package:networking/Response.dart';
import 'package:user_info_widgets/TextBoxHeadingsAndContent.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';
import 'package:general_widgets/LoadingWidgets.dart';
LoginVariables userCredentials;
FacultyInfo facultyInfo;

class FacultyInformation extends StatefulWidget
{
  @override
  _FacultyInfoState createState() => _FacultyInfoState();

  FacultyInformation(LoginVariables user)
  {
    userCredentials = user;
  }

}

class _FacultyInfoState extends State<FacultyInformation>
{
  UserInfoBloc userInfoBloc;


  @override
  void initState()
  {
    userInfoBloc =
        UserInfoBloc(userCredentials.user, userCredentials.user_id);
  }

  @override
  Widget build(BuildContext context)
  {
    return StreamBuilder<Response<dynamic>>
    (
      stream: userInfoBloc.infoStream,
      builder: (context,snapshot)
      {
        if (snapshot.hasData)
        {
          switch (snapshot.data.status)
          {
            case Status.LOADING:

              break;
            case Status.COMPLETED:
              facultyInfo = snapshot.data.data;
              return FacultyInfoView();
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
class FacultyInfoView extends StatelessWidget
{
  List<String> Headings =
  [
    "Member Name:",
    "Gender:",
    "Nationality:",
    "Phone Numbers:",
    "Department:",
    "",
  ];
  List<String> Content =
  [
    facultyInfo.personName,
    facultyInfo.gender,
    facultyInfo.nationality,
    getContacts(facultyInfo.phoneNumber),
    facultyInfo.facultyMajor.majorDepartment.departmentName,
    "",
  ];

  @override
  Widget build(BuildContext context)
  {
    return HeadingsandContentWidget(content: Content,headings: Headings);
  }
}