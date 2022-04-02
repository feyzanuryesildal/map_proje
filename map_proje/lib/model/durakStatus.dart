import 'package:cloud_firestore/cloud_firestore.dart';

class durakStatus {
  late String id;
  late String durakIisim;
  late String durakEnlem;
  late String durakBoylam;

  durakStatus(
      {required this.id,
      required this.durakIisim,
      required this.durakEnlem,
      required this.durakBoylam});

  factory durakStatus.fromSnapshot(DocumentSnapshot snapshot) {
    return durakStatus(
        id: snapshot.id,
        durakIisim: snapshot["durakIisim"],
        durakEnlem: snapshot["durakEnlem"],
        durakBoylam: snapshot["durakBoylam"]);
  }
}
