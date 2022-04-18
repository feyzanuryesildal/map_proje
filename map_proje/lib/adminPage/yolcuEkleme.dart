import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_proje/service/mapDurakMarker.dart';
import 'package:map_proje/service/yolcuEkleme_service.dart';

class yolcuEkleme extends StatefulWidget {
  const yolcuEkleme({Key? key}) : super(key: key);

  @override
  _yolcuEklemeState createState() => _yolcuEklemeState();
}

class _yolcuEklemeState extends State<yolcuEkleme> {
  yolcuEklemeService _statusService = yolcuEklemeService();
  Duraklar duraklar = Duraklar();
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Durak ismi",
                    hintText: "Durak ismi",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple))),
                controller: t1,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "Yolcu sayısı",
                    hintText: "Yolcu sayısı",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
                controller: t2,
              ),
              const SizedBox(
                height: 10,
              ),
              RaisedButton(
                  color: Colors.deepPurpleAccent[400],
                  child: Text(
                    "Ekle",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    _statusService.addStatus(t1.text, t2.text);
                  }),
              Expanded(
                child: StreamBuilder(
                    stream: _statusService.getYolcuStatus(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      return !snapshot.hasData
                          ? CircularProgressIndicator()
                          : ListView.builder(
                              itemCount: snapshot.data?.docs.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot mypost =
                                    snapshot.data!.docs[index];
                                Future<void> _showChoiseDialog(
                                    BuildContext) async {
                                  return await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                              "Silmek istediğinize emin misiniz?"),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          content: Container(
                                            child: Row(
                                              children: [
                                                InkWell(
                                                  child: Text("Evet"),
                                                  onTap: () => _statusService
                                                      .removeStatus(mypost.id)
                                                      .then((value) =>
                                                          Navigator.pop(
                                                              context)),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                InkWell(
                                                  child: Text("Hayır"),
                                                  onTap: () =>
                                                      Navigator.pop(context),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                }

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () =>
                                        _showChoiseDialog(BuildContext),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.white, width: 2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Card(
                                        elevation: 10,
                                        shadowColor: Colors.blueAccent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        color: Colors.white70,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                      "${mypost.data()["durakIsim"]}"),
                                                  Text(" "),
                                                  Text(
                                                      "${mypost.data()["yolcuSayisi"]}"),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class streamBuilder extends StatefulWidget {
  const streamBuilder({Key? key}) : super(key: key);

  @override
  _streamBuilderState createState() => _streamBuilderState();
}

class _streamBuilderState extends State<streamBuilder> {
  yolcuEklemeService _statusService = yolcuEklemeService();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _statusService.getYolcuStatus(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return !snapshot.hasData
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot mypost = snapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("${mypost["durakIsim: "]}"),
                                    Text("${mypost["yolcuSayisi"]}"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
        });
  }
}
