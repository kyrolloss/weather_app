import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Screens/Astronomy%20Screen/Astronomy%20Screen.dart';
import 'package:weather_app/Screens/Future%20Screen/Future%20Screen.dart';
import 'package:weather_app/Screens/Home%20Screen/Home%20Screen.dart';
import 'package:weather_app/Screens/Search%20Screen/Search%20Screen.dart';

import 'marine Screen/marine Screen.dart';

class MainLayout extends StatefulWidget {
  MainLayout({super.key});

  late Widget _widget = const HomeScreen();
  List<Widget> widgets = [
    const HomeScreen(),
    const FutureScreen(),
    const AstronomyScreen(),
    const MarineScreen()
  ];

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late int selectedTab;

  @override
  void initState() {
    super.initState();
    selectedTab = 0;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: widget._widget,
      backgroundColor: const Color(0xff090122),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CrystalNavigationBar(

          enableFloatingNavBar: true,
          itemPadding: const EdgeInsets.all(10),
          currentIndex: selectedTab,
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.black.withOpacity(0.1),
          onTap: (p0) {
            setState(() {
              selectedTab = p0;
              widget._widget = widget.widgets[p0];
            });
          },
          items: [
            CrystalNavigationBarItem(
              icon: Icons.home,
              unselectedIcon: Icons.home_outlined,
              selectedColor: Colors.white,
            ),

            CrystalNavigationBarItem(
              icon: Icons.calendar_month_outlined,
              unselectedIcon: Icons.calendar_month_sharp,
              selectedColor: Colors.white,
            ),
            CrystalNavigationBarItem(
                icon: Icons.sunny,
                unselectedIcon: Icons.sunny_snowing,
                selectedColor: Colors.white),
            CrystalNavigationBarItem(
                icon: Icons.water,
                unselectedIcon: Icons.water_sharp,
                selectedColor: Colors.white)
          ],
        ),
      ),
    );
  }
}
