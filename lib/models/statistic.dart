// ignore_for_file: prefer_const_constructors_in_immutables, unused_label

import 'package:equatable/equatable.dart';

class Statistik {
  double streng;
  double defense;
  double agility;

  Statistik({
    this.agility,
    this.defense,
    this.streng,
  });

  // ignore: missing_return
  factory Statistik.fromJson(Map<String, dynamic> json) {
    streng:
    json['streng'];
    agility:
    json['agility'];
    defense:
    json['defense'];
  }

  Map<String, dynamic> toJson() {
    return {
      "streng": streng,
      "agility": agility,
      "defense": defense,
    };
  }
}
