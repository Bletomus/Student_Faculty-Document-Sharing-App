
import 'package:blocs/UserInfoBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/LoadingWidgets.dart';
import 'package:models/StudentInfo.dart';
import 'package:networking/Response.dart';
import 'package:app_constants/LoginInformation.dart';
import 'package:user_info_widgets/TextBoxHeadingsAndContent.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';



class StudentInformation extends StatefulWidget
{
  final LoginVariables userCredentials;
  StudentInformation({Key key,this.userCredentials}) : super(key: key);

  @override
  _StudentInfoState createState() => _StudentInfoState();


}
class _StudentInfoState extends State<StudentInformation>
{
  UserInfoBloc _userInfoBloc;
  StudentInfo _studentInfo;

  @override
  void initState()
  {
    super.initState();
    _userInfoBloc = UserInfoBloc(widget.userCredentials.user, widget.userCredentials.user_id);
  }

  @override
  Widget build(BuildContext context)
  {
    return StreamBuilder<Response<dynamic>>
    (
      stream: _userInfoBloc.infoStream,
      builder: (context,snapshot)
      {
        if (snapshot.hasData)
        {
          switch (snapshot.data.status)
          {
            case Status.LOADING:

              break;
            case Status.COMPLETED:
              _studentInfo = snapshot.data.data;
              return StudentInfoView(studentInfo: _studentInfo,);
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



class StudentInfoView extends StatelessWidget
{
  StudentInfoView({Key key,this.studentInfo}) : super(key: key);
  final StudentInfo studentInfo;


  @override
  Widget build(BuildContext context)
  {
    final List<String> _content =
    [
      studentInfo.studentName,
      studentInfo.studentNumber.toString(),
      studentInfo.studentGender,
      studentInfo.idType,
      studentInfo.enrollmentDate,
      studentInfo.originCountry,
      studentInfo.studentNationality,
      studentInfo.placeOfBirth,
      getContacts(studentInfo.studentPhoneNumber),
      studentInfo.studentMajor.major,
      studentInfo.studentMajor.majorDepartment.departmentName,
      "",
    ];
    final List<String> _headings =
    [
      "Student name:",
      "Student Number:",
      "Gender:",
      "Identification Type:",
      "Date Of Enrollment:",
      "Country of Origin:",
      "Nationality:",
      "Place of Birth:",
      "Phone Numbers:",
      "Major:",
      "Department:",
      "",
    ];
    return HeadingsandContentWidget(content: _content,headings: _headings);
  }

}





