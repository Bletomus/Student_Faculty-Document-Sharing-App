import 'package:app_constants/s_f_d_s_m_s_icons_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class NavBar
{
  List<PersistentBottomNavBarItem> navBarsItems =
  [
    PersistentBottomNavBarItem
      (
      icon: Icon(SFDSMSIcons.data_center),
      title: ("Center"),
      activeColor: CupertinoColors.activeBlue,
      inactiveColor: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem
      (
      icon: Icon(SFDSMSIcons.home),
      title: ("Home"),
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
}

