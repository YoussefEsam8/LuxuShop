import 'package:app_fixed/core/them/app_them.dart';
import 'package:flutter/material.dart';

class CustombottomNavgationBar extends StatelessWidget {
  final int cuarentindex;
  final Function(int) ontap;
  const CustombottomNavgationBar({
    super.key,
    required this.cuarentindex,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 15,
      iconSize: 20,
      currentIndex: cuarentindex,
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
