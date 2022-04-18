import 'dart:convert';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:map_proje/kullaniciMainPage/kullaniciLoginPage.dart';
import 'package:map_proje/service/mapDurakMarker.dart';

import 'adminPage/adminLoginPage.dart';

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
        brightness: Brightness.light,
        primaryColor: Colors.deepPurpleAccent[400],
        accentColor: Colors.deepPurpleAccent[400],
      ),
      home: AnimatedSplashScreen(
        splash: Lottie.network(
            'https://assets3.lottiefiles.com/packages/lf20_nxzfykro.json'),
        nextScreen: secim(),
        splashTransition: SplashTransition.scaleTransition,
        duration: 3000,
        splashIconSize: 200,
      ),
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 100,
            ),
            FlatButton(
              minWidth: MediaQuery.of(context).size.width * 0.5,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => adminLoginPage(),
                  ),
                );
              },
              child: Text(
                "Admin",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.deepPurpleAccent[400],
            ),
            FlatButton(
              minWidth: MediaQuery.of(context).size.width * 0.5,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => kullaniciLoginPage(),
                    ));
              },
              child: Text(
                "Kullanıcı",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.deepPurpleAccent[400],
            ),
            SizedBox(
              height: 100,
            ),
            Lottie.network(
                'https://assets5.lottiefiles.com/packages/lf20_WAMQ5G.json')
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
