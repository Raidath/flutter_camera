import 'package:extract_text_picture/views/home.dart';
import 'package:extract_text_picture/views/camera.dart';
import 'package:flutter/material.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          HomePage(),
          CameraPage(),
        ],
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: WaterDropNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutCubic,
          );
        },
        barItems: [
          BarItem(
            filledIcon: Icons.home,
            outlinedIcon: Icons.home,
          ),
          BarItem(
            filledIcon: Icons.camera_alt_sharp,
            outlinedIcon: Icons.camera_alt_sharp,
          ),
        ],
      ),
    );
  }
}
