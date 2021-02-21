



import 'package:app_constants/LoginInformation.dart';
import 'package:app_constants/ThemeConstants.dart';
import 'package:blocs/TeachesBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/DialogBox.dart';
import 'package:general_widgets/LoadingWidgets.dart';
import 'package:general_widgets/UploadFunctionWithNote.dart';
import 'package:models/Teaches.dart';
import 'package:networking/Response.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';
import 'package:general_widgets/Rower.dart';
import 'package:view/FacultyHome.dart';

List<Teaches> _students ;
List<ClassOfStudents> _studentList;

class SendFiles extends StatefulWidget
{

  @override
  _SendFilesState createState() => _SendFilesState();

  SendFiles({Key key,this.userCredentials}) : super(key: key);
  final LoginVariables userCredentials;
}

class _SendFilesState extends State<SendFiles>
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
              _students = snapshot.data.data;
              return StudentListView();
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
              DialogBox.showMessage(context, "Error Loading", "There seems to be a problem with the app, please send us feedback on the error and we will get to you soon!");
            }
        );

      return FacultyHome(userCredentials: widget.userCredentials);
      },
    );
  }

}

class StudentListView extends StatefulWidget
{
  @override
  _StudentListState createState() => _StudentListState();

}
class _StudentListState extends State<StudentListView>
{
  List<int> getChecked()
  {
    if(_studentList != null)
    {
      List <ClassOfStudents> names = [];
      List<int> filteredList=[];

      Map<int, int> mpNames = {};
      for (var item in _studentList)
      {
        if(item.isChecked)
          mpNames[item.studentNumber] = item.studentNumber;
      }
      filteredList = mpNames.values.toList();
      return filteredList;
    }
    return [];
  }
  List <ClassOfStudents> getStudents()
  {
    if(_studentList == null)
    {
      List <ClassOfStudents> names = [];
      List<ClassOfStudents> filteredList=[];
      for (var item in _students)
      {
        names.addAll(item.classOfStudents);
      }
      Map<String, ClassOfStudents> mpNames = {};
      for (var item in names)
      {
        mpNames[item.studentName] = item;
      }
      filteredList = mpNames.values.toList();
      return filteredList;
    }
    return _studentList;

  }
  @override
  Widget build(BuildContext context)
  {
    _studentList = getStudents();
    return whiteBackGroundWidget(insiderWidget:
      Container
      (
        child:Column
        (
          children:<Widget>
          [
            Expanded
            (
              child:ListView.builder
                (
                itemCount: _studentList.length,
                itemBuilder: (context,index)
                {
                  return Container
                    (
                    margin: EdgeInsets.fromLTRB(ConstantVariables.marginLeft,ConstantVariables.marginTop,ConstantVariables.marginRight,ConstantVariables.marginBottom),
                    child: Checker(index),
                  );
                },
              ),
            ),
            ElevatedButton
            (
              style: ButtonStyle
              (
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white) ,
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent) ,
                shape:MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),),),
              ),

              child: Text.rich(TextSpan(text: "Select File", style: TextStyle(fontFamily: "Poppins"))),
              onPressed:
              ()
              async
              {
                List<int> filteredList = getChecked();
                String dept = _students[0].teacher.facultyMajor.majorDepartment.departmentName;
                debugPrint(filteredList.length.toString());
                if(filteredList.length > 0)
                  await findUploadNote(context,_students[0].teacher.personNumber.toString(),filteredList,dept);
              },
            ),
          ],
        ),
      ),
    );
  }

}
class Checker extends StatefulWidget
{
  int index;

  Checker(this.index);

  @override
  _CheckerState createState() => _CheckerState(index);

}

class _CheckerState extends State<Checker>
{
  int index;

  _CheckerState(this.index);

  @override
  Widget build(BuildContext context)
  {
    return CheckboxListTile
    (
      activeColor: Colors.white,
      checkColor: Colors.blue,
      dense: true,
      selected: _studentList[index].isChecked,
      value: _studentList[index].isChecked,
      secondary: SizedBox
        (
          width: 200,
          child: Rower(_studentList[index].studentNumber.toString(),_studentList[index].studentName)
      ),
      onChanged: (bool val)
      {
        setState(()
        {
          _studentList[index].isChecked =val;
        });

      }
    );
  }

}