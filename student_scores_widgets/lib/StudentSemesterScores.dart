import 'package:app_constants/LoginInformation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/DialogBox.dart';
import 'package:general_widgets/LoadingWidgets.dart';
import 'package:networking/Response.dart';
import 'package:models/StudentScores.dart';
import 'package:blocs/StudentScoresBlocs.dart';
import 'package:student_scores_widgets/CourseBox.dart';
import 'package:user_info_widgets/BlueBackGround.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';
import 'package:view/StudentHome.dart';

class StudentSemesterScores extends StatefulWidget
{
  StudentSemesterScores({Key key,this.userCredentials}) : super(key: key);
  final LoginVariables userCredentials;

  @override
  _SemesterScoresState createState() => _SemesterScoresState();

}

class _SemesterScoresState extends State<StudentSemesterScores>
{

  StudentScoresBlocs studentScoresBlocs;
  @override
  void initState()
  {
    super.initState();
    studentScoresBlocs = StudentScoresBlocs(widget.userCredentials.user_id);
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
              return whiteBackGroundWidget(insiderWidget: LoadingCircle(),);
              break;
            case Status.COMPLETED:
              return SemesterScoresView(studentScores: snapshot.data.data,);
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
        WidgetsBinding.instance.addPostFrameCallback
          (
                (_)
            {
              DialogBox.showMessage(context, "Error Loading", "There seems to be a problem with the app!! Please send me a message");
            }
        );
        return StudentHome(userCredentials: widget.userCredentials);


      },
    );
  }

}

class SemesterScoresView extends StatelessWidget
{
  SemesterScoresView({Key key,this.studentScores}) : super(key: key);
  final List<StudentScores> studentScores;

  @override
  Widget build(BuildContext context)
  {
    return BlueBackGroundWidget
    (
      insiderWidget: ScoreList(studentScores: studentScores),
    );

  }

}

