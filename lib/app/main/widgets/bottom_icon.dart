import 'package:flutter/material.dart';
import 'package:ufrgs_mobile/utils/colors.dart';

const double ICON_SIZE = 24;
BottomNavigationBarItem getBottomNavigationItem(String imgPath, String label) {
  return BottomNavigationBarItem(
    icon: Image.asset(
      imgPath,
      width: ICON_SIZE,
      height: ICON_SIZE,
      color: AppColors.unselectedIcon,
    ),
    activeIcon: Image.asset(
      imgPath,
      width: ICON_SIZE,
      height: ICON_SIZE,
      color: AppColors.red,
    ),
    label: label,
  );
}
