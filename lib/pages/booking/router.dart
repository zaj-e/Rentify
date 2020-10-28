import 'package:auth_test/pages/booking/home.dart';
import 'package:auth_test/pages/booking/settings.dart';
import 'package:auth_test/components/navigation.dart';
import 'package:auth_test/visual/colors.dart';
import 'package:flutter/cupertino.dart';

class AppRouter extends StatelessWidget {
  static final List<Widget Function(BuildContext)> tabs_function = [
    (context) => HomePage(),
    (context) => SettingsPage(),
  ];

  static final List<BottomNavigationBarItem> tabs_display = [
    NavigationComponents.customBottomNavigationBarItem(
      iconURI: 'assets/svg/home.svg',
      title: 'Home',
      activeColor: customColor.active,
    ),
    NavigationComponents.customBottomNavigationBarItem(
      iconURI: 'assets/svg/settings.svg',
      title: 'Settings',
      activeColor: customColor.active,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBuilder: (BuildContext context, int index) {
        if (index < tabs_function.length) {
          return CupertinoTabView(builder: tabs_function[index]);
        }
        return null;
      },
      tabBar: CupertinoTabBar(
          //UGLY, fix
          inactiveColor: CupertinoColors.black,
          activeColor: customColor.active,
          items: tabs_display),
    );
  }
}
