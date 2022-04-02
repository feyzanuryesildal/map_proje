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
  durakEkleme(),
  adminMainPage(),
];
int clickItem = 0;

class _navigationBarMenuState extends State<navigationBarMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.blueGrey,
          currentIndex: clickItem,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_box,
                  size: 30,
                ),
                label: "Yolcu Ekle"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_box, size: 30), label: "Durak Ekle"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_box, size: 30), label: "Seferleri Gör"),
          ],
          onTap: (index) => setState(() {
                clickItem = index;
              })),
      body: screens[clickItem],
    );
  }
}
