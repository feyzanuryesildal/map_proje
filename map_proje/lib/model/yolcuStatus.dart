import 'package:cloud_firestore/cloud_firestore.dart';

class yolcuStatus {
  late String id;
  late String durakIisim;
  late String yolcuSayisi;

  yolcuStatus({
    required this.id,
    required this.durakIisim,
    required this.yolcuSayisi,
  });

  factory yolcuStatus.fromSnapshot(DocumentSnapshot snapshot) {
    return yolcuStatus(
      id: snapshot.id,
      durakIisim: snapshot["durakIisim"],
      yolcuSayisi: snapshot["yolcuSayisi"],
    );
  }
}
