import 'package:flutter/material.dart';
import 'package:map_proje/service/mapDurakMarker.dart';

class yolcuEkleme extends StatefulWidget {
  late String title = "";

  @override
  _yolcuEklemeState createState() => _yolcuEklemeState();
}

class _yolcuEklemeState extends State<yolcuEkleme> {
  Duraklar duraklar = Duraklar();
  TextFormField t1 = TextFormField();
  TextFormField t2 = TextFormField();
  TextFormField t3 = TextFormField();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Durak ismi",
                    hintText: "Durak ismi",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "enlem",
                    hintText: "enlem",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "boylam",
                    hintText: "boylam",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
