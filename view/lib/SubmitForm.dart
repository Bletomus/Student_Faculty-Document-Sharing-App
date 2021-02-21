import 'package:app_constants/LoginInformation.dart';
import 'package:app_constants/ThemeConstants.dart';
import 'package:app_constants/s_f_d_s_m_s_icons_icons.dart';
import 'package:blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/DialogBox.dart';
import 'package:networking/Response.dart';
import 'FacultyHome.dart';
import 'StudentHome.dart';


LoginVariables _userCredentials = LoginVariables();
class SubmitForm extends StatefulWidget
{
  final String title = 'Campus Life';
  @override
  _LoginInScreenState createState() => _LoginInScreenState();
}
class _LoginInScreenState extends State<SubmitForm>
{
  final _formKey = GlobalKey<FormState>();
  ExistenceBloc _bloc;
  TextEditingController _idController = TextEditingController();

  @override
  void dispose()
  {
    _idController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context)
  {
    return Form
      (
      key: _formKey,
      child: Scaffold
        (
        appBar: AppBar(title: Text(widget.title)),
        body: Center
          (
          child: Container
            (
            padding: EdgeInsets.all(2),
            child: Column
              (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>
              [
                Image.asset("assets/logo/" + ConstantVariables.logo,width: 100, height: 100),
                Container
                  (
                  child: Column
                    (
                    children: <Widget>
                    [
                      TextFormField
                        (
                          controller: _idController,
                          decoration: InputDecoration
                          (
                            labelText: "Enter User ID",
                            fillColor: Colors.white,
                            border: OutlineInputBorder
                              (
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(),
                              ),
                        ),
                        validator: (id)
                        {
                          if(id.isEmpty)
                          {
                            return "Please enter the ID";
                          }
                          else if(id.length < 10)
                          {
                            return "ID is too short";
                          }
                          else if(id.length > 10)
                          {
                            return "ID is too long";
                          }
                          else
                          {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontFamily: "Poppins"),
                      ),
                      UserSelectionDropDownBox(),

                      ElevatedButton
                      (
                        style: ElevatedButton.styleFrom
                        (
                          onPrimary: Colors.white,
                          primary: Colors.blueAccent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),),
                        ),
                        child: Text.rich(TextSpan(text: "Search", style: TextStyle(fontFamily: "Poppins"))),
                        onPressed:
                            ()
                        {
                          if(_formKey.currentState.validate())
                          {
                              _bloc =ExistenceBloc(_userCredentials.user,_idController.text);
                              Navigator.push
                              (
                                context,MaterialPageRoute
                                (
                                  builder: (context)
                                  {
                                    return StreamBuilder<Response<bool>>
                                      (
                                      stream: _bloc.isAvailableStream,
                                      builder: (context,snapshot)
                                      {
                                        if (snapshot.hasData)
                                        {
                                          switch (snapshot.data.status)
                                          {
                                            case Status.LOADING:
                                              return Scaffold
                                                (
                                                body: Center
                                                (
                                                  child:CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),),
                                                ),
                                              );
                                              break;
                                            case Status.COMPLETED:
                                              if(snapshot.data.data == true)
                                              {
                                                debugPrint(snapshot.data.data.toString());
                                                _userCredentials.isloggedIn = true;
                                                _userCredentials.user_id = _idController.text;
                                                if(_userCredentials.user == 1)
                                                  return StudentHome(userCredentials: _userCredentials);
                                                else
                                                  return FacultyHome(userCredentials: _userCredentials);
                                              }
                                              else
                                              {
                                                WidgetsBinding.instance.addPostFrameCallback
                                                (
                                                  (_)
                                                  {
                                                    DialogBox.showMessage(context, "Error Loading", "The user you entered does not exist in the database! Please enter a valid User ID");
                                                  }
                                                );
                                              }
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
                                        return SubmitForm();
                                      },
                                    );
                                  },
                                )
                              );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}



class UserSelectionDropDownBox extends StatefulWidget
{
  @override
  _UserDropDownState createState() => _UserDropDownState();


}

class _UserDropDownState extends State<UserSelectionDropDownBox>
{
  int _value = 1;
  @override
  Widget build(BuildContext context)
  {
    return DropdownButtonHideUnderline
      (
      child: DropdownButton
        (
        value: _value,
        items:
        [
          DropdownMenuItem
            (
            child: Row
              (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>
              [
                Icon(SFDSMSIcons.student),
                SizedBox(width: 10),
                Text.rich(TextSpan(text: "Student", style: TextStyle(fontFamily: "Poppins"))),
              ],
            ),
            value : 1,
          ),
          DropdownMenuItem
            (
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>
              [
                Icon(SFDSMSIcons.teacher),
                SizedBox(width: 10),
                Text.rich(TextSpan(text: "Faculty Member", style: TextStyle(fontFamily: "Poppins"))),
              ],
            ),
            value : 2,
          ),
        ],
        onChanged: (value)
        {
          setState
            (
              ()
              {
                _value = value;
                _userCredentials.user = value;
              }
          );
        },
        isExpanded: true,
      ),
    );
  }
}
