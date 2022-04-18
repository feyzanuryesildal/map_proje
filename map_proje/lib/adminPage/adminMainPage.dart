import 'package:flutter/material.dart';
import 'package:map_proje/service/mapDurakMarker.dart';
import 'package:map_proje/service/status_service.dart';

import 'adminMapPage.dart';

class adminMainPage extends StatefulWidget {
  const adminMainPage({Key? key}) : super(key: key);

  @override
  _adminMainPageState createState() => _adminMainPageState();
}

class _adminMainPageState extends State<adminMainPage> {
  StatusService _statusService = StatusService();
  Duraklar duraklar = Duraklar();
  late List<dynamic> ilce;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 10,
            shadowColor: Colors.blueAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.white70,
            child: ListTile(
              trailing: Icon(Icons.car_repair),
              title: Text(
                "Hat 1",
                style: TextStyle(color: Colors.black),
              ),
              subtitle: Column(
                children: [
                  Row(
                    children: const [
                      Text("Araç kapasitesi: ",
                          style: TextStyle(color: Colors.black54)),
                      Text("25", style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                  Row(
                    children: const [
                      Text("Yolcu sayısı: ",
                          style: TextStyle(color: Colors.black54)),
                      Text("0", style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 10,
            shadowColor: Colors.blueAccent,
            color: Colors.white70,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              trailing: Icon(Icons.car_repair),
              title: Text(
                "Hat 2",
                style: TextStyle(color: Colors.black),
              ),
              subtitle: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        "Araç kapasitesi: ",
                        style: TextStyle(color: Colors.black54),
                      ),
                      Text(
                        "30",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        "Yolcu sayısı: ",
                        style: TextStyle(color: Colors.black54),
                      ),
                      Text(
                        "0",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 10,
            shadowColor: Colors.blueAccent,
            color: Colors.white70,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              trailing: Icon(Icons.car_repair),
              title: Text(
                "Hat 3",
                style: TextStyle(color: Colors.black),
              ),
              subtitle: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        "Araç kapasitesi: ",
                        style: TextStyle(color: Colors.black54),
                      ),
                      Text(
                        "40",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        "Yolcu sayısı: ",
                        style: TextStyle(color: Colors.black54),
                      ),
                      Text(
                        "0",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          /*Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: FlatButton(
                  minWidth: MediaQuery.of(context).size.width * 0.5,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => durakEkleme(),
                      ),
                    );
                  },
                  child: Text("Durak ekle"),
                  color: Colors.blueAccent,
                ), //Your widget here,
              ),
            ),
          ),*/
        ],
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

class navigationBar1 extends StatelessWidget {
  const navigationBar1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, Colors.black],
          begin: FractionalOffset(0, 0),
          end: FractionalOffset(0, 1),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: SizedBox(
          height: 56,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
