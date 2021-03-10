import 'package:app_constants/LoginInformation.dart';
import 'package:blocs/UserInfoBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/DialogBox.dart';
import 'package:models/TeacherInfo.dart';
import 'package:networking/Response.dart';
import 'package:user_info_widgets/TextBoxHeadingsAndContent.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';
import 'package:general_widgets/LoadingWidgets.dart';
import 'package:view/FacultyHome.dart';
import 'package:view/SubmitForm.dart';

class FacultyInformation extends StatefulWidget
{
  @override
  _FacultyInfoState createState() => _FacultyInfoState();


  final LoginVariables userCredentials;
  FacultyInformation({Key key,this.userCredentials}): super(key:key);

}

class _FacultyInfoState extends State<FacultyInformation>
{
  UserInfoBloc userInfoBloc;


  @override
  void initState()
  {
    super.initState();
    userInfoBloc =
        UserInfoBloc(widget.userCredentials.user, widget.userCredentials.user_id);
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
              return whiteBackGroundWidget(insiderWidget: LoadingCircle(),);
              break;
            case Status.COMPLETED:

              return FacultyInfoView(facultyInfo: snapshot.data.data,);
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
class FacultyInfoView extends StatelessWidget
{
  FacultyInfoView({Key key, this.facultyInfo}) : super(key : key);
  final FacultyInfo facultyInfo;
  final List<String> _headings =
  [
    "Member Name:",
    "Gender:",
    "Nationality:",
    "Phone Numbers:",
    "Department:",
    "",
  ];


  @override
  Widget build(BuildContext context)
  {
    final List<String> _content =
    [
      facultyInfo.personName,
      facultyInfo.gender,
      facultyInfo.nationality,
      getContacts(facultyInfo.phoneNumber),
      facultyInfo.facultyMajor.majorDepartment.departmentName,
      "",
    ];
    return HeadingsandContentWidget(content: _content,headings: _headings);
  }
}