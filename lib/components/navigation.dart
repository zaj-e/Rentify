import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class NavigationComponents {
//  static BottomNavigationBarItem customBottomNavigationBarItem(
//      {String iconURI, String title, Color activeColor}) {
//    return BottomNavigationBarItem(
//        icon: SvgPicture.asset(iconURI),
//        activeIcon: SvgPicture.asset(iconURI, color: activeColor),
//        title: Text(title));
//  }

  static BottomNavigationBarItem customBottomNavigationBarItem(
      {String iconURI, String title, Color activeColor}) {
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(iconURI),
        activeIcon: SvgPicture.asset(iconURI, color: activeColor),
        title: Text(title));
  }
}
