
import 'package:blocs/UserInfoBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/LoadingWidgets.dart';
import 'package:models/StudentInfo.dart';
import 'package:networking/Response.dart';
import 'package:app_constants/LoginInformation.dart';
import 'package:user_info_widgets/TextBoxHeadingsAndContent.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';

LoginVariables userCredentials;
StudentInfo studentInfo;
class StudentInformation extends StatefulWidget
{

  @override
  _StudentInfoState createState() => _StudentInfoState();

  StudentInformation(LoginVariables user)
  {
    userCredentials = user;
  }

}
class _StudentInfoState extends State<StudentInformation>
{
  UserInfoBloc userInfoBloc;


  @override
  void initState()
  {
    userInfoBloc = UserInfoBloc(userCredentials.user, userCredentials.user_id);
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
              studentInfo = snapshot.data.data;
              return StudentInfoView();
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
  List<String> Headings =
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
  List<String> Content =
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
  @override
  Widget build(BuildContext context)
  {
    return HeadingsandContentWidget(content: Content,headings: Headings);
  }

}





