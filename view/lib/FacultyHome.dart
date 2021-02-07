import 'package:app_constants/ThemeConstants.dart';
import 'package:faculty_info_package/FacultyInformation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_widgets/CenterBox.dart';
import 'package:general_widgets/CenterOptions.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:upload_download_widget/FacultyRandA.dart';
import 'package:app_constants/LoginInformation.dart';
import 'package:app_constants/s_f_d_s_m_s_icons_icons.dart';
import 'package:faculty_notifications_widget/FacultyNotificationsPage.dart';
import 'package:teaches_widget/FacultyOptions.dart';
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

  static List<Widget> _widgetOptions = <Widget>
  [
    FacultyApplicationCenter(),
    FacultyNotificationsPage(userCredentials),
    FacultyOptions(userCredentials),
  ];
  PersistentTabController _controller;
  @override
  void initState()
  {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }
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

class FacultyApplicationCenter extends StatelessWidget
{
  final List<CenterOptions> selection =
  [
    CenterOptions("Faculty Member information","assets/icons/teacherLogo.svg"),
    CenterOptions("Course Resources and Assignments","assets/icons/rAndA.svg"),
  ];
  final List<Widget> facultyWidgets =
  [
    FacultyInformation(userCredentials),
    FacultyRAndA(userCredentials),
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
              screen: facultyWidgets[index],
              withNavBar: true, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          }
        );
      },
    );
  }

}



