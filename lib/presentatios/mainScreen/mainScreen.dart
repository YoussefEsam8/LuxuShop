import 'package:app_fixed/core/constants/strings.dart';
import 'package:app_fixed/presentatios/views/Categories/categories_screen.dart';
import 'package:app_fixed/presentatios/views/home/customBottomNavgation.dart';
import 'package:app_fixed/presentatios/views/home/homeScreen.dart';
import 'package:flutter/material.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _Mainscreen();
}

class _Mainscreen extends State<Mainscreen> {
  int currentIndex = 0;
  List<Widget> pages = [
    Homescreen(),
    CategoriesScreen(),

    //  CartScreen(),
    //  ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: CustombottomNavgationBar(
        currentIndex: currentIndex,
        ontap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
