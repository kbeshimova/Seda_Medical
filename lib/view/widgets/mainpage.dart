import 'package:flutter/material.dart';
import 'package:seda/view/screens/directions.dart';
import 'package:seda/global/global.dart';
import 'package:seda/view/screens/home.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [Home(), Directions()];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          margin: EdgeInsets.only(bottom: 21, left: 20, right: 20),
          padding: EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(25),
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: white.withOpacity(0.5),
            selectedFontSize: 12,
            unselectedLabelStyle: TextStyle(height: 2),
            selectedIconTheme: IconThemeData(color: Colors.white, size: 30),
            currentIndex: currentIndex,
            onTap: onTap,
            items: [
              for (var i = 0; i < tabData.length; i++)
                BottomNavigationBarItem(
                  icon: Opacity(
                    opacity: currentIndex == i ? 1 : 0.4,
                    child: Image.asset(
                      tabData[i].img,
                      height: 25,
                    ),
                  ),
                  label: tabData[i].label,
                ),
            ],
          ),
        ),
      ),
    );
  }

  List<TabData> tabData = [
    TabData(img: 'assets/catalog.png', label: 'Home'),
    TabData(img: 'assets/home.png', label: 'Catalog'),
  ];
}

class TabData {
  String img;
  String label;
  TabData({required this.img, required this.label});
}
