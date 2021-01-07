import 'package:app_constants/LoginInformation.dart';
import 'package:app_constants/ThemeConstants.dart';
import 'package:app_constants/s_f_d_s_m_s_icons_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/CenterBox.dart';
import 'package:general_widgets/CenterOptions.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:student_info_widgets/StudentInformation.dart';
import 'package:view/StudentCourseList.dart';
import 'package:view/StudentSemesterSchedule.dart';
import 'package:view/StudentSemesterScores.dart';
import 'StudentRAndA.dart';

LoginVariables userCredentials;
class StudentHome extends StatefulWidget
{


  StudentHome(LoginVariables loginVariables)
  {
    userCredentials = loginVariables;
  }

  @override
  _HomeState createState() => _HomeState();


}

class _HomeState extends State<StudentHome>
{
  PersistentTabController _controller;


  @override
  void initState()
  {
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _widgetOptions = <Widget>
  [
    StudentNotifications(),
    StudentApplicationCenter(),
    StudentOptions(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems =
  [
    PersistentBottomNavBarItem
    (
      icon: Icon(SFDSMSIcons.home),
      title: ("Home"),
      activeColor: CupertinoColors.activeBlue,
      inactiveColor: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem
    (
      icon: Icon(SFDSMSIcons.data_center),
      title: ("Center"),
      activeColor: CupertinoColors.activeBlue,
      inactiveColor: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem
    (
      icon: Icon(SFDSMSIcons.settings),
      title: ("Settings"),
      activeColor: CupertinoColors.activeBlue,
      inactiveColor: CupertinoColors.systemGrey,
    ),
  ];


  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar(title: Text("SFDSMS Application Center")),
      body: PersistentTabView
      (
        context,
        controller: _controller,
        screens: _widgetOptions,
        items: _navBarsItems,
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears.
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
        decoration: NavBarDecoration
        (
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( duration: Duration(milliseconds: 200), curve: Curves.ease,),
        screenTransitionAnimation: ScreenTransitionAnimation
        ( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.simple, // Choose the nav bar style with this property.
      ),
    );
  }



}

class StudentApplicationCenter extends StatelessWidget
{
  List<CenterOptions> selection =
  [
    CenterOptions("Student information","assets/logo/studentInfo.svg"),
    CenterOptions("Semester Scores","assets/logo/scores.svg"),
    CenterOptions("Course List","assets/logo/courseList.svg"),
    CenterOptions("Semester Schedule","assets/logo/clipboard.svg"),
    CenterOptions("Course resources and Assignments","assets/logo/rAndA.svg"),
  ];
  List<Widget> studentWidgets =
  [
    StudentInformation(userCredentials),
    StudentSemesterScores(),
    StudentCourseList(),
    StudentSemesterSchedule(),
    StudentRAndA(),
  ];
  @override
  Widget build(BuildContext context)
  {
    return GridView.builder
    (
      itemCount:selection.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: ConstantVariables.axisCount),
      itemBuilder: (context,index)
      {
        return GestureDetector
        (
          child:CenterBoxWidget(selection[index]),
          onTap:
          ()
          {
            pushNewScreen
            (
              context,
              screen: studentWidgets[index],
              withNavBar: true, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          }
        );
      },
    );
  }
}



class StudentNotifications extends StatelessWidget
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


class StudentOptions extends StatelessWidget
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