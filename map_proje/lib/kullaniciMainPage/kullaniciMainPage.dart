import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:map_proje/service/mapDurakMarker.dart';

import 'kullaniciMapPage.dart';

class kullaniciMainPage extends StatefulWidget {
  const kullaniciMainPage({Key? key}) : super(key: key);

  @override
  _kullaniciMainPageState createState() => _kullaniciMainPageState();
}

class _kullaniciMainPageState extends State<kullaniciMainPage> {
  Duraklar duraklar = Duraklar();
  late List<dynamic> ilce;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString("lib/duraklar.json"),
                builder: (context, a) {
                  ilce = jsonDecode(a.data.toString());
                  return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: 12,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Card(
                              elevation: 10,
                              shadowColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: Colors.white70,
                              child: FlatButton(

                                  //padding: EdgeInsets.all(10),
                                  minWidth:
                                      MediaQuery.of(context).size.width * 1,
                                  onPressed: () {
                                    var baslik = ilce[index]["DurakIsim"];
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              kullaniciMapPage(),
                                        ));
                                  },
                                  child: Text(' ${ilce[index]["DurakIsim"]}')),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      });
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => kullaniciMapPage(),
              ));
        },
        child: const Icon(Icons.map_outlined),
      ),
    );
  }
}
