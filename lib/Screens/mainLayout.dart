import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Screens/Astronomy%20Screen/Astronomy%20Screen.dart';
import 'package:weather_app/Screens/Future%20Screen/Future%20Screen.dart';
import 'package:weather_app/Screens/Home%20Screen/Home%20Screen.dart';
import 'package:weather_app/cubits/app_cubit.dart';

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

    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: widget._widget,
          backgroundColor: cubit.backgroundColor,
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CrystalNavigationBar(
              itemPadding: const EdgeInsets.all(10),
              currentIndex: selectedTab,
              unselectedItemColor: Colors.white70,
              backgroundColor: cubit.backgroundColor,
              outlineBorderColor:  selectedTab ==1?  Colors.black : selectedTab == 2?Colors.black:Colors.white ,
              onTap: (p0) {
                setState(() {
                  selectedTab = p0;
                  widget._widget = widget.widgets[p0];
                  cubit.backgroundColor = cubit.color[p0];
                });
              },
              items: [
                CrystalNavigationBarItem(
                  icon: Icons.home,
                  unselectedIcon: Icons.home_outlined,
                  selectedColor: selectedTab == 1
                      ? cubit.color1[selectedTab]
                      : selectedTab == 2?Colors.black:Colors.white,
                  unselectedColor: selectedTab == 1 ? cubit.color1[selectedTab]
                      :selectedTab == 2?Colors.black:Colors.white,
                ),
                CrystalNavigationBarItem(
                  icon: Icons.calendar_month_outlined,
                  unselectedIcon: Icons.calendar_month_sharp,
                  selectedColor: selectedTab == 1
                      ? cubit.color1[selectedTab]
                      : selectedTab == 2?Colors.black:Colors.white,
                  unselectedColor: selectedTab == 1 ? cubit.color1[selectedTab]
                      :selectedTab == 2?Colors.black:Colors.white,
                ),
                CrystalNavigationBarItem(
                  icon: Icons.sunny,
                  unselectedIcon: Icons.sunny_snowing,
                  selectedColor: selectedTab == 1
                      ? cubit.color1[selectedTab]
                      : selectedTab == 2?Colors.black: Colors.white,
                  unselectedColor: selectedTab == 1 ? cubit.color1[selectedTab]
                      :selectedTab == 2?Colors.black:Colors.white,
                ),
                CrystalNavigationBarItem(
                  icon: Icons.water,
                  unselectedIcon: Icons.water_sharp,
                  selectedColor: selectedTab == 1
                      ? cubit.color1[selectedTab]
                      :selectedTab == 2?Colors.black: Colors.white,
                  unselectedColor: selectedTab == 1 ? cubit.color1[selectedTab]
                      :selectedTab == 2?Colors.black:Colors.white,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
