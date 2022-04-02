import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:map_proje/model/durakStatus.dart';

class StatusService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<durakStatus> addStatus(
      String durakIsim, String durakEnlem, String durakBoylam) async {
    var ref = _firestore.collection("Duraklar");

    var documentRef = await ref.add({
      "durakIsim": durakIsim,
      "durakEnlem": durakEnlem,
      "durakBoylam": durakBoylam,
    });
    return durakStatus(
        id: documentRef.id,
        durakIisim: durakIsim,
        durakEnlem: durakEnlem,
        durakBoylam: durakBoylam);
  }

  // veri gösterme
  Stream<QuerySnapshot> getdurakStatus() {
    var ref = _firestore.collection("Duraklar").snapshots();
    return ref;
  }

  // veri silme
  Future<void> removeStatus(String docId) {
    var ref = _firestore.collection("Duraklar").doc(docId).delete();
    return ref;
  }
}
