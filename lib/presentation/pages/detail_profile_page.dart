// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pusbindiklat_global/models/date_time.dart';
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
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 10),
                      width: 120,
                      height: 130,
                      color: Colors.white,
                      child: Image.asset("assets/programmer.png"),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 50,
                        top: 17,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            users.namaLengkap,
                            style: primaryTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            DateTimeUtils.formatCharMonthDateTime(
                                users.tanggalLahir),
                            maxLines: 1,
                            style: primaryTextStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Remaja",
                            style: primaryTextStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Tanding Dan Seni",
                            style: primaryTextStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
