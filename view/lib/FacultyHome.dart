import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:view/s_f_d_s_m_s_icons_icons.dart';

import 'SelectionConstants.dart';
LoginVariables userCredentials;

class FacultyHome extends StatefulWidget
{


  FacultyHome(LoginVariables loginVariables)
  {
    userCredentials = loginVariables;
  }

  @override
  _HomeState createState() => _HomeState();


}

class _HomeState extends State<FacultyHome>
{

  int _selectedIndex = 1;

  void _onItemTapped(int index)
  {
    setState
      (
            ()
        {
          _selectedIndex = index;
        }
    );
  }

  static List<Widget> _widgetOptions = <Widget>
  [
    FacultyApplicationCenter(),
    FacultyNotifications(),
    FacultyOptions(),
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Application Center")),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex),),
      bottomNavigationBar: BottomNavigationBar
        (
          items: const <BottomNavigationBarItem>
          [
            BottomNavigationBarItem
              (
              icon: Icon(SFDSMSIcons.home),
              label: "Home",
            ),
            BottomNavigationBarItem
              (
              icon: Icon(SFDSMSIcons.data_center),
              label: "Center",
            ),
            BottomNavigationBarItem
              (
              icon: Icon(SFDSMSIcons.settings),
              label: "Setting",
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 2
      ),
    );
  }



}

class FacultyApplicationCenter extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Center
      (
      child: Text('Student Application Center'),
    );
  }

}

class FacultyNotifications extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {

    return Center
      (
      child: Text('Student Notifications'),
    );

  }

}

class FacultyOptions extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {

    return Center
      (
      child: Text('Student Options'),
    );
  }

}
