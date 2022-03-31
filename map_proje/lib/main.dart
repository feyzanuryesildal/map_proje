import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_proje/service/mapDurakMarker.dart';

import 'adminPage/adminMainPage.dart';
import 'kullaniciMainPage/kullaniciMainPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: secim(),
    );
  }
}

class secim extends StatefulWidget {
  const secim({Key? key}) : super(key: key);

  @override
  _secimState createState() => _secimState();
}

class _secimState extends State<secim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              minWidth: MediaQuery.of(context).size.width * 0.5,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => adminMainPage(),
                  ),
                );
              },
              child: Text("Admin Girişi"),
              color: Colors.blueAccent,
            ),
            FlatButton(
              minWidth: MediaQuery.of(context).size.width * 0.5,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => kullaniciMainPage(),
                    ));
              },
              child: Text("Kullanıcı Girişi"),
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////// veri leri eklrana çeken kısım

class sayfa extends StatefulWidget {
  const sayfa({Key? key}) : super(key: key);

  @override
  _sayfaState createState() => _sayfaState();
}

class _sayfaState extends State<sayfa> {
  Duraklar duraklar = Duraklar();
  late List<dynamic> ilce;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                    index++;
                    return Text(ilce[index]["DurakIsim"]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
