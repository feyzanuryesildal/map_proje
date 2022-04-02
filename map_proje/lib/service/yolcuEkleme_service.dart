import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:map_proje/model/yolcuStatus.dart';

class yolcuEklemeService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<yolcuStatus> addStatus(
    String durakIsim,
    String yolcuSayisi,
  ) async {
    var ref = _firestore.collection("Yolcular");

    var documentRef = await ref.add({
      "durakIsim": durakIsim,
      "yolcuSayisi": yolcuSayisi,
    });
    return yolcuStatus(
      id: documentRef.id,
      durakIisim: durakIsim,
      yolcuSayisi: yolcuSayisi,
    );
  }

  // veri gösterme
  Stream<QuerySnapshot> getYolcuStatus() {
    var ref = _firestore.collection("Yolcular").snapshots();
    return ref;
  }

  // veri silme
  Future<void> removeStatus(String docId) {
    var ref = _firestore.collection("Yolcular").doc(docId).delete();
    return ref;
  }
}
