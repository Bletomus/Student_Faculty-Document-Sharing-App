import 'package:app_constants/LoginInformation.dart';
import 'package:app_constants/ThemeConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/CenterBox.dart';
import 'package:general_widgets/CenterOptions.dart';
import 'package:general_widgets/NavigationBar.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:student_info_widgets/StudentInformation.dart';
import 'package:courses_widget/StudentCourseList.dart';
import 'package:student_scores_widgets/StudentSemesterScores.dart';
import 'package:student_schedule_widget/StudentSemesterSchedule.dart';
import 'package:student_notifications_widget/StudentNotificationsPage.dart';
import 'package:student_options_widget/StudentOptions.dart';
import 'package:student_upload_download_widget/StudentRAndA.dart';


class StudentHome extends StatefulWidget
{
  StudentHome({Key key,this.userCredentials}) : super(key: key);
  final LoginVariables userCredentials;

  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<StudentHome>
{
  PersistentTabController _controller;
  static LoginVariables _userCredentials ;

  @override
  void initState()
  {
    super.initState();
    _userCredentials = widget.userCredentials;
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _widgetOptions = <Widget>
  [
    StudentApplicationCenter(userCredentials: _userCredentials,),
    StudentNotificationsPage(userCredentials: _userCredentials),
    StudentOptions(),
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
        items: NavBar().navBarsItems,
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration
        (
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( duration: Duration(milliseconds: 200), curve: Curves.ease,),
        screenTransitionAnimation: ScreenTransitionAnimation
        (
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.simple, // Choose the nav bar style with this property.
      ),
    );
  }



}
class StudentApplicationCenter extends StatefulWidget
{
  StudentApplicationCenter({Key key,this.userCredentials}) : super(key: key);
  final LoginVariables userCredentials;

  @override
  _CenterState createState() => _CenterState();
}
class _CenterState extends State<StudentApplicationCenter>
{

  static LoginVariables _userCredentials;

  final List<CenterOptions> _selection =
  [
    CenterOptions("Student information","assets/icons/studentInfo.svg"),
    CenterOptions("Semester Scores","assets/icons/scores.svg"),
    CenterOptions("Course List","assets/icons/courseList.svg"),
    CenterOptions("Semester Schedule","assets/icons/clipboard.svg"),
    CenterOptions("Course resources and Assignments","assets/icons/rAndA.svg"),
  ];
  final List<Widget> _studentWidgets =
  [
    StudentInformation(userCredentials: _userCredentials),
    StudentSemesterScores(userCredentials: _userCredentials),
    StudentCourseList(userCredentials: _userCredentials),
    StudentSemesterSchedule(userCredentials: _userCredentials),
    StudentRAndA(userCredentials: _userCredentials),
  ];
  @override
  Widget build(BuildContext context)
  {
    return GridView.builder
    (
      itemCount:_selection.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: ConstantVariables.axisCount),
      itemBuilder: (context,index)
      {
        return GestureDetector
        (
          child:CenterBoxWidget(_selection[index]),
          onTap:
          ()
          {
            pushNewScreen
            (
              context,
              screen: _studentWidgets[index],
              withNavBar: true, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          }
        );
      },
    );
  }

  @override
  void initState()
  {
    super.initState();
    _userCredentials = widget.userCredentials;
  }
}


