// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pusbindiklat_global/models/get_user.dart';
import 'package:pusbindiklat_global/styles/style.dart';

class DetailProfilePage extends StatelessWidget {
  final Data users;
  DetailProfilePage({this.users});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Detail",
          style: primaryTextStyle.copyWith(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Center(
            child: Text(users.namaLengkap),
          )
        ],
      )),
    );
  }
}
