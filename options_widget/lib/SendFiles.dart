



import 'package:app_constants/LoginInformation.dart';
import 'package:app_constants/ThemeConstants.dart';
import 'package:blocs/TeachesBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/LoadingWidgets.dart';
import 'package:general_widgets/UploadFunctionWithNote.dart';
import 'package:models/Teaches.dart';
import 'package:networking/Response.dart';
import 'package:user_info_widgets/WhiteBackGround.dart';
import 'package:general_widgets/Rower.dart';
LoginVariables userCredentials;
List<Teaches> students ;
List<ClassOfStudents> studentList;
class SendFiles extends StatefulWidget
{

  @override
  _SendFilesState createState() => _SendFilesState();

  SendFiles(LoginVariables loginVariables)
  {
    userCredentials =loginVariables;
  }
}

class _SendFilesState extends State<SendFiles>
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

              break;
            case Status.COMPLETED:
              students = snapshot.data.data;
              return StudentListView();
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

class StudentListView extends StatefulWidget
{
  @override
  _StudentListState createState() => _StudentListState();

}
class _StudentListState extends State<StudentListView>
{
  List<int> getChecked()
  {
    if(studentList != null)
    {
      List <ClassOfStudents> names = [];
      List<int> filteredList=[];

      Map<int, int> mpNames = {};
      for (var item in studentList)
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
    if(studentList == null)
    {
      List <ClassOfStudents> names = [];
      List<ClassOfStudents> filteredList=[];
      for (var item in students)
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
    return studentList;

  }
  @override
  Widget build(BuildContext context)
  {
    studentList = getStudents();
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
                itemCount: studentList.length,
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
                String dept = students[0].teacher.facultyMajor.majorDepartment.departmentName;
                debugPrint(filteredList.length.toString());
                if(filteredList.length > 0)
                  await findUploadNote(context,students[0].teacher.personNumber.toString(),filteredList,dept);
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
      selected: studentList[index].isChecked,
      value: studentList[index].isChecked,
      secondary: SizedBox
        (
          width: 200,
          child: Rower(studentList[index].studentNumber.toString(),studentList[index].studentName)
      ),
      onChanged: (bool val)
      {
        setState(()
        {
          studentList[index].isChecked =val;
        });

      }
    );
  }

}