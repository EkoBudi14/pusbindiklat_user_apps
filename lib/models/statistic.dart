// ignore_for_file: prefer_const_constructors_in_immutables, unused_label

import 'package:equatable/equatable.dart';

// class Statistik extends Equatable {
//   final int userId;
//   final double strength;
//   final double power;
//   final double agility;

//   Statistik({
//     this.userId,
//     this.agility,
//     this.power,
//     this.strength,
//   });

//   // ignore: missing_return
//   factory Statistik.fromJson(Map<String, dynamic> json) {
//     userId:
//     json['user_id'];
//     strength:
//     json['strength'];
//     agility:
//     json['agility'];
//     power:
//     json['power'];
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "user_id": userId,
//       "strength": strength,
//       "agility": agility,
//       "power": power,
//     };
//   }

//   Statistik copyWith({
//     int userId,
//     double strength,
//     double agility,
//     double power,
//   }) =>
//       Statistik(
//         userId: userId ?? this.userId,
//         strength: strength ?? this.strength,
//         agility: agility ?? this.agility,
//         power: power ?? this.power,
//       );

//   @override
//   // TODO: implement props
//   List<Object> get props => [
//         userId,
//         strength,
//         agility,
//         power,
//       ];
// }

class Statistic {
  Statistic({
    this.userId,
    this.strength,
    this.agility,
    this.power,
  });

  String userId;
  String strength;
  String agility;
  String power;

  factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
        userId: json["user_id"],
        strength: json["strength"],
        agility: json["agility"],
        power: json["power"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "strength": strength,
        "agility": agility,
        "power": power,
      };
}
