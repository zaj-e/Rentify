import 'package:rentify/views/account/detail_account.dart';
import 'package:rentify/views/office/create_office.dart';
import 'package:rentify/views/office/home.dart';
import 'package:rentify/views/office/list_offices.dart';
import 'package:rentify/views/reservations/create_reservation.dart';
import 'package:rentify/views/reservations/list_reservation.dart';

import './components.dart';
import 'package:rentify/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class AppRouter extends StatelessWidget {
  static final List<Widget Function(BuildContext)> tabs_function = [
    (context) => HomePage(),
        (context) => OfficeListPage(),
    (context) => OfficeListPage(),
    (context) => ReservationListPage(),
  (context) => DetailAccountPage()
  ];

  static final List<BottomNavigationBarItem> tabs_display = [
    NavigationComponents.customBottomNavigationBarItem(
      iconURI: 'assets/svg/office.svg',
      title: 'My Offices',
      activeColor: customColor.active,
    ),
    NavigationComponents.customBottomNavigationBarItem(
      iconURI: 'assets/svg/search.svg',
      title: 'Search',
      activeColor: customColor.active,
    ),
    NavigationComponents.customBottomNavigationBarItem(
      iconURI: 'assets/svg/home.svg',
      title: 'Home',
      activeColor: customColor.active,
    ),
    NavigationComponents.customBottomNavigationBarItem(
      iconURI: 'assets/svg/reservations.svg',
      title: 'My Reservations',
      activeColor: customColor.active,
    ),
    NavigationComponents.customBottomNavigationBarItem(
      iconURI: 'assets/svg/profile.svg',
      title: 'Profile',
      activeColor: customColor.active,
    )
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
        items: tabs_display,
      ),
    );
  }
}
