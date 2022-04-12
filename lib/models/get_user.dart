// // To parse this JSON data, do
// //
// //     final getUser = getUserFromJson(jsonString);

// import 'dart:convert';

// GetUser getUserFromJson(String str) => GetUser.fromJson(json.decode(str));

// String getUserToJson(GetUser data) => json.encode(data.toJson());

// class GetUser {
//   GetUser({
//     this.meta,
//     this.data,
//   });

//   Meta meta;
//   Data data;

//   factory GetUser.fromJson(Map<String, dynamic> json) => GetUser(
//         meta: Meta.fromJson(json["meta"]),
//         data: Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "meta": meta.toJson(),
//         "data": data.toJson(),
//       };
// }

// class Data {
//   Data({
//     this.id,
//     this.namaLengkap,
//     this.alamat,
//     this.tanggalLahir,
//     this.email,
//     this.createdAt,
//     this.statistic,
//   });

//   int id;
//   String namaLengkap;
//   String alamat;
//   DateTime tanggalLahir;
//   String email;
//   DateTime createdAt;
//   List<Statistic> statistic;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         namaLengkap: json["namaLengkap"],
//         alamat: json["alamat"],
//         tanggalLahir: DateTime.parse(json["tanggalLahir"]),
//         email: json["email"],
//         createdAt: DateTime.parse(json["created_at"]),
//         statistic: List<Statistic>.from(
//             json["statistic"].map((x) => Statistic.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "namaLengkap": namaLengkap,
//         "alamat": alamat,
//         "tanggalLahir": tanggalLahir.toIso8601String(),
//         "email": email,
//         "created_at": createdAt.toIso8601String(),
//         "statistic": List<dynamic>.from(statistic.map((x) => x.toJson())),
//       };
// }

// class Statistic {
//   Statistic({
//     this.userId,
//     this.strength,
//     this.agility,
//     this.power,
//   });

//   int userId;
//   int strength;
//   int agility;
//   int power;

//   factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
//         userId: json["user_id"],
//         strength: json["strength"],
//         agility: json["agility"],
//         power: json["power"],
//       );

//   Map<String, dynamic> toJson() => {
//         "user_id": userId,
//         "strength": strength,
//         "agility": agility,
//         "power": power,
//       };
// }

// class Meta {
//   Meta({
//     this.status,
//     this.code,
//   });

//   String status;
//   int code;

//   factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         status: json["status"],
//         code: json["code"],
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "code": code,
//       };
// }

import 'package:pusbindiklat_global/models/statistic.dart';

class Data {
  Data({
    this.id,
    this.namaLengkap,
    this.alamat,
    this.tanggalLahir,
    this.email,
    this.createdAt,
    this.statistic,
  });

  int id;
  String namaLengkap;
  String alamat;
  DateTime tanggalLahir;
  String email;
  DateTime createdAt;
  List<Statistic> statistic;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        namaLengkap: json["namaLengkap"],
        alamat: json["alamat"],
        tanggalLahir: DateTime.parse(json["tanggalLahir"]),
        email: json["email"],
        createdAt: DateTime.parse(json["created_at"]),
        statistic: List<Statistic>.from(
            json["statistic"].map((x) => Statistic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "namaLengkap": namaLengkap,
        "alamat": alamat,
        "tanggalLahir": tanggalLahir.toIso8601String(),
        "email": email,
        "created_at": createdAt.toIso8601String(),
        "statistic": List<dynamic>.from(statistic.map((x) => x.toJson())),
      };
}
