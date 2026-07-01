import 'package:app_fixed/core/constants/strings.dart';
import 'package:app_fixed/core/them/app_them.dart';
// import 'package:app_fixed/presentatios/views/Categories/categories_screen.dart';
import 'package:flutter/material.dart';

class CustombottomNavgationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) ontap;
  const CustombottomNavgationBar({
    super.key,
    required this.currentIndex,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 15,
      iconSize: 20,
      currentIndex: currentIndex,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppTheme.primaryGold,
      unselectedItemColor: AppTheme.primaryBlack,
      selectedIconTheme: IconThemeData(color: AppTheme.primaryGold),
      unselectedIconTheme: IconThemeData(color: AppTheme.primaryBlack),
      onTap: (value) {
        ontap(value);
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: "Categories",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: "Cart",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
