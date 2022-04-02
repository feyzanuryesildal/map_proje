import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:map_proje/service/mapDurakMarker.dart';
import 'package:map_proje/service/status_service.dart';

class durakEkleme extends StatefulWidget {
  late String title = "";

  @override
  _durakEklemeState createState() => _durakEklemeState();
}

class _durakEklemeState extends State<durakEkleme> {
  StatusService _statusService = StatusService();
  Duraklar duraklar = Duraklar();
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
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
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Durak ismi",
                    hintText: "Durak ismi",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
                controller: t1,
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
                controller: t2,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "boylam",
                    hintText: "boylam",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
                controller: t3,
              ),
              RaisedButton(
                  child: Text("Ekle"),
                  onPressed: () {
                    _statusService.addStatus(t1.text, t2.text, t3.text);
                  }),
              Expanded(
                child: StreamBuilder(
                    stream: _statusService.getdurakStatus(),
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
                                            color: Colors.black45, width: 2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                    "${mypost.data()["durakIsim"]}"),
                                                Text(" "),
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
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
