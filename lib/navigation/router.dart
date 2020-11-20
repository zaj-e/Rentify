import 'package:rentify/views/create_reservation.dart';
import 'package:rentify/views/office_list.dart';
import 'package:rentify/views/reservation_list.dart';

import './components.dart';
import 'package:rentify/views/home.dart';
import 'package:rentify/views/settings.dart';
import 'package:rentify/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class AppRouter extends StatelessWidget {
  static final List<Widget Function(BuildContext)> tabs_function = [
    (context) => HomePage(),
    (context) => OfficeListPage(),
    (context) => ReservationListPage()
  ];

  static final List<BottomNavigationBarItem> tabs_display = [
    NavigationComponents.customBottomNavigationBarItem(
      iconURI: 'assets/svg/home.svg',
      title: 'Home',
      activeColor: customColor.active,
    ),
    NavigationComponents.customBottomNavigationBarItem(
      iconURI: 'assets/svg/office.svg',
      title: 'Offices',
      activeColor: customColor.active,
    ),
    NavigationComponents.customBottomNavigationBarItem(
      iconURI: 'assets/svg/reservations.svg',
      title: 'Reservations',
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
        items: tabs_display,
      ),
    );
  }
}
