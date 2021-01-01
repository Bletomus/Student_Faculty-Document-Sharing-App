import 'package:blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:networking/Response.dart';
import 'package:view/s_f_d_s_m_s_icons_icons.dart';

import 'FacultyHome.dart';
import 'StudentHome.dart';
import 'LogoConstants.dart';
import 'SelectionConstants.dart';

LoginVariables user_Credentials = LoginVariables();
class SubmitForm extends StatefulWidget
{

  @override
  _LoginInScreenState createState() => _LoginInScreenState('Campus Life');
}
class _LoginInScreenState extends State<SubmitForm>
{
  _LoginInScreenState(this.title);
  final _formKey = GlobalKey<FormState>();
  final String title;
  ExistenceBloc bloc;
  TextEditingController idController = TextEditingController();
  @override
  void dispose()
  {
    // Clean up the controller when the widget is disposed.
    idController.dispose();
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
        appBar: AppBar(title: Text(this.title)),
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
                Image.asset("assets/logo/" + LogoConstants.logo,width: 100, height: 100),
                Container
                  (
                  child: Column
                    (
                    children: <Widget>
                    [
                      TextFormField
                        (
                          controller: idController,
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

                      RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blueAccent,
                        child: Text.rich(TextSpan(text: "Search", style: TextStyle(fontFamily: "Poppins"))),
                        onPressed:
                            ()
                        {
                          if(_formKey.currentState.validate())
                          {
                              bloc =ExistenceBloc(user_Credentials.user,idController.text);
                              Navigator.push
                              (
                                context,MaterialPageRoute
                                (
                                  builder: (context)
                                  {
                                    return StreamBuilder<Response<bool>>
                                      (
                                      stream: bloc.isAvailableStream,
                                      builder: (context,snapshot)
                                      {
                                        if (snapshot.hasData)
                                        {
                                          switch (snapshot.data.status)
                                          {
                                            case Status.LOADING:

                                              break;
                                            case Status.COMPLETED:
                                              if(snapshot.data.data == true)
                                              {
                                                user_Credentials.isloggedIn = true;
                                                if(user_Credentials.user == 1)
                                                  return StudentHome(user_Credentials);
                                                else
                                                  return FacultyHome(user_Credentials);
                                              }
                                              else
                                              {
                                                return SubmitForm();
                                              }


                                              break;
                                            default:
                                            //case Status.ERROR:
                                              return Scaffold
                                              (
                                                body: Center
                                                (
                                                  child:Text("There seems to be a problem with the connection!",style: TextStyle(color: Colors.black, fontSize: 24,),),
                                                ),
                                              );

                                              break;
                                          }
                                        }
                                        return Scaffold
                                        (
                                          body: Center
                                          (
                                              child:CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                )
                              );


                              //user_Credentials.user_id = idController.text;
                              //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(user_Credentials.user_id)));
                              //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Failed')));

                          }
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),),
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
                user_Credentials.user = value;
              }
          );
        },
        isExpanded: true,
      ),
    );
  }
}