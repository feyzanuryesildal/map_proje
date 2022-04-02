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
          Card(
            elevation: 10,
            shadowColor: Colors.blueAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.redAccent,
            child: ListTile(
              trailing: Icon(Icons.car_repair),
              title: Text("Hat 1"),
              subtitle: Column(
                children: [
                  Row(
                    children: const [
                      Text("Araç kapasitesi: "),
                      Text("25"),
                    ],
                  ),
                  Row(
                    children: const [
                      Text("Yolcu sayısı: "),
                      Text("0"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 10,
            shadowColor: Colors.blueAccent,
            color: Colors.orangeAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              trailing: Icon(Icons.car_repair),
              title: Text("Hat 2"),
              subtitle: Column(
                children: [
                  Row(
                    children: const [
                      Text("Araç kapasitesi: "),
                      Text("30"),
                    ],
                  ),
                  Row(
                    children: const [
                      Text("Yolcu sayısı: "),
                      Text("0"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 10,
            shadowColor: Colors.blueAccent,
            color: Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              trailing: Icon(Icons.car_repair),
              title: Text("Hat 3"),
              subtitle: Column(
                children: [
                  Row(
                    children: const [
                      Text("Araç kapasitesi: "),
                      Text("40"),
                    ],
                  ),
                  Row(
                    children: const [
                      Text("Yolcu sayısı: "),
                      Text("0"),
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
