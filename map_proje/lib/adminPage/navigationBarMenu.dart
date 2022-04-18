import 'package:flutter/material.dart';
import 'package:map_proje/adminPage/adminMainPage.dart';
import 'package:map_proje/adminPage/yolcuEkleme.dart';

import 'durakEkleme.dart';

class navigationBarMenu extends StatefulWidget {
  const navigationBarMenu({Key? key}) : super(key: key);

  @override
  _navigationBarMenuState createState() => _navigationBarMenuState();
}

final screens = [
  yolcuEkleme(),
  adminMainPage(),
  durakEkleme(),
];
int clickItem = 1;

class _navigationBarMenuState extends State<navigationBarMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.deepPurpleAccent[400],
          unselectedItemColor: Colors.blueGrey,
          currentIndex: clickItem,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  size: clickItem == 0 ? 35 : 25,
                ),
                label: "Yolcu Ekle"),
            BottomNavigationBarItem(
                icon: Icon(Icons.car_repair, size: clickItem == 1 ? 35 : 25),
                label: "Seferler"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add, size: clickItem == 2 ? 35 : 25),
                label: "Durak Ekle"),
          ],
          onTap: (index) => setState(() {
                clickItem = index;
              })),
      body: screens[clickItem],
    );
  }
}
