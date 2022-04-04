// ignore_for_file: prefer_const_constructors_in_immutables, unused_label

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pusbindiklat_global/models/statistic.dart';

class User extends Equatable {
  final String email;
  final String password;
  final String namaLengkap;
  final String alamat;
  final String tanggalLahir;
  static int id;
  // List<Statistik> statistik = [];
  static String token;

  User({
    this.namaLengkap,
    this.alamat,
    this.tanggalLahir,
    this.email,
    this.password,
    // this.id,
    // this.statistik,
  });

  // ignore: missing_return
  factory User.fromJson(Map<String, dynamic> json) {
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
    // id:
    // json['id'].toString();
    // statistik:
    // json['statistic']
    //     .map<Statistik>((statisticUser) => Statistik.fromJson(statisticUser))
    //     .toList();
  }

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "tanggalLahir": tanggalLahir,
        "namaLengkap": namaLengkap,
        "alamat": alamat,
        // "id": id,
      };

  User copyWith({
    int id,
    String email,
    String password,
    String tanggalLahir,
    String namaLengkap,
    String alamat,
  }) =>
      User(
        // id: id ?? this.id,
        email: email ?? this.email,
        password: password ?? this.password,
        tanggalLahir: tanggalLahir ?? this.tanggalLahir,
        namaLengkap: namaLengkap ?? this.namaLengkap,
        alamat: alamat ?? this.alamat,
      );

  @override
  // TODO: implement props
  List<Object> get props =>
      [email, password, tanggalLahir, namaLengkap, alamat];
}
