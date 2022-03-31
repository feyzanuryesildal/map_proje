import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Duraklar {
  String? durakIsim;
  String? enlem;
  String? boylam;

  Duraklar({this.durakIsim, this.enlem, this.boylam});

  Duraklar.fromJson(Map<String, dynamic> json) {
    durakIsim = json['DurakIsim'];
    enlem = json['enlem'];
    boylam = json['boylam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DurakIsim'] = this.durakIsim;
    data['enlem'] = this.enlem;
    data['boylam'] = this.boylam;
    return data;
  }

  void yazdir(BuildContext context) {
    final response =
        DefaultAssetBundle.of(context).loadString("lib/duraklar.json");
    final jsonModel = json.decode(response.toString());
    final durakList = jsonModel
        .map((e) => Duraklar.fromJson(e as Map<String, dynamic>))
        .toList()
        .cast<Duraklar>();
    return durakList;
  }
}
