import 'package:flutter/material.dart';
import 'package:map_proje/adminPage/yolcuEkleme.dart';
import 'package:map_proje/service/mapDurakMarker.dart';

import 'adminMapPage.dart';

class adminMainPage extends StatefulWidget {
  const adminMainPage({Key? key}) : super(key: key);

  @override
  _adminMainPageState createState() => _adminMainPageState();
}

class _adminMainPageState extends State<adminMainPage> {
  Duraklar duraklar = Duraklar();
  late List<dynamic> ilce;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            FlatButton(
              minWidth: MediaQuery.of(context).size.width * 0.5,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => yolcuEkleme(),
                  ),
                );
              },
              child: Text("Durak ekle"),
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => adminMapPage(),
              ));
        },
        child: const Icon(Icons.map_outlined),
      ),
    );
  }
}
