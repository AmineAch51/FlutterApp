import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/routes.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'favourite.dart';
import 'home.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  PersistentTabController _controller = PersistentTabController(initialIndex: 0);
  int pageIndex=0;
  @override
  void initState() {
    super.initState();
    _controller.addListener(buttomNavigatorListener);
    setState(() {
      pageIndex=_controller.index;
    });
  }
  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(buttomNavigatorListener);
  }
  List<Widget> _buildScreens() {
    return [
      Home(),
      Favourite()
    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.home),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey
      ),
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.heart_solid),
          activeColorPrimary: CupertinoColors.systemRed,
          inactiveColorPrimary: CupertinoColors.systemGrey
      ),
    ];
  }

  void buttomNavigatorListener() {
    setState(() {
      pageIndex=_controller.index;
    });
  }

  String getTitle() {
    switch(_controller.index) {
      case 0: return Routes.home;
      case 1: return Routes.favourite;
    }
    return "Somting wrong";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black54,
              ),
              onTap: () {
                exit(0); // exit
              },
            ),
            Text(
              getTitle(),
              style: const TextStyle(
                  color: Colors.black54
              ),
            ),
            const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )
          ],
        ),
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
  }
}