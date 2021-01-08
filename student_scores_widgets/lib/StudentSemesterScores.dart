import 'package:app_constants/LoginInformation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/LoadingWidgets.dart';
import 'package:networking/Response.dart';
import 'package:models/StudentScores.dart';
import 'package:blocs/StudentScoresBlocs.dart';
import 'package:student_scores_widgets/CourseBox.dart';
import 'package:user_info_widgets/BlueBackGround.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';
LoginVariables userCredentials;
List<StudentScores> studentScores;
class StudentSemesterScores extends StatefulWidget
{
  StudentSemesterScores(LoginVariables loginVariables)
  {
    userCredentials = loginVariables;
  }

  @override
  _SemesterScoresState createState() => _SemesterScoresState();

}

class _SemesterScoresState extends State<StudentSemesterScores>
{

  StudentScoresBlocs studentScoresBlocs;
  @override
  void initState()
  {
    studentScoresBlocs = StudentScoresBlocs(userCredentials.user_id);
  }
  @override
  Widget build(BuildContext context)
  {
    return StreamBuilder<Response<dynamic>>
      (
      stream: studentScoresBlocs.scoresStream,
      builder: (context,snapshot)
      {
        if (snapshot.hasData)
        {
          switch (snapshot.data.status)
          {
            case Status.LOADING:

              break;
            case Status.COMPLETED:
              studentScores = snapshot.data.data;
              return SemesterScoresView();
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

class SemesterScoresView extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlueBackGroundWidget
    (
      insiderWidget: ScoreList(studentScores: studentScores),
    );

  }

}

