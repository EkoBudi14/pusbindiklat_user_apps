// ignore_for_file: unused_label

import 'package:pusbindiklat_global/models/statistic.dart';

class Getuser {
  int id;
  String namaLengkap;
  String alamat;
  String tanggalLahir;
  String email;
  List<Statistik> statistik = [];

  Getuser({
    this.namaLengkap,
    this.alamat,
    this.tanggalLahir,
    this.email,
    this.id,
    this.statistik,
  });

  // ignore: missing_return
  Getuser.fromJson(Map<String, dynamic> json) {
    email:
    json['email'];
    password:
    json['password'];
    tanggalLahir:
    json['tanggalLahir'];
    namaLengkap:
    json['namaLengkap'];
    alamat:
    json['alamat'];
    id:
    json['id'].toString();
    statistik:
    json['statistic']
        .map<Statistik>((statisticUser) => Statistik.fromJson(statisticUser))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "tanggalLahir": tanggalLahir,
      "namaLengkap": namaLengkap,
      "alamat": alamat,
      "id": id,
      "statistic": statistik.map((statistic) => statistic.toJson()).toList(),
    };
  }
}
