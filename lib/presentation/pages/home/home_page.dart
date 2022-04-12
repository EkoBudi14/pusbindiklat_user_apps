// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, deprecated_member_use, unnecessary_string_interpolations, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:pusbindiklat_global/cubit/getuser_cubit.dart';
import 'package:pusbindiklat_global/cubit/userauth_cubit.dart';
import 'package:pusbindiklat_global/models/statistic.dart';
import 'package:pusbindiklat_global/models/user_login.dart';
import 'package:pusbindiklat_global/presentation/pages/detail_profile_page.dart';
import 'package:pusbindiklat_global/presentation/pages/main_page.dart';
import 'package:pusbindiklat_global/presentation/pages/sign_in_page.dart';
import 'package:pusbindiklat_global/presentation/pages/statistik_detail.dart';
import 'package:pusbindiklat_global/services/local_storage.dart';
import 'package:pusbindiklat_global/styles/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spider_chart/spider_chart.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Future getData() async {
      String idUsers = await SecureStorage.getUid();

      var res = await http.get(
        Uri.parse("http://tssabes.my.id/api/users/$idUsers"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${User.token}"
        },
      );

      print(json.decode(res.body));
      return json.decode(res.body);
    }

    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // User user = authProvider.user;
    String saveText = '';

    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/logo_ts_bulat.png',
              width: 50,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Pusbindiklat",
              style: primaryTextStyle.copyWith(
                fontWeight: bold,
              ),
            )
          ],
        ),
        toolbarHeight: 70,
        actions: [
          IconButton(
            onPressed: () async {
              setState(() {
                // authProvider.logOut();
                context.read<UserauthCubit>().signOut();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => SignInPage()));
                print("Berhasil Keluar");
              });
            },
            icon: Icon(
              Icons.logout,
              size: 30,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   margin: EdgeInsets.only(
            //     left: defaultMargin,
            //     right: defaultMargin,
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Container(
            //         width: 55,
            //         height: 55,
            //         decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           image: DecorationImage(
            //             image: AssetImage('assets/logo_ts_bulat.png'),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         child: Icon(
            //           Icons.logout,
            //           size: 30,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                top: 10,
              ),
              child: Text(
                "Profile",
                style: primaryTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 18,
                ),
              ),
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              onPressed: () async {
                String val = await SecureStorage.getUid();
                print(val);
                setState(() {
                  saveText = val;
                });
              },
              child: Text(
                "load data",
                style: TextStyle(color: Colors.black),
              ),
            ),

            Text(
              saveText,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 240,
              child: BlocBuilder<GetuserCubit, GetuserState>(
                builder: (context, state) {
                  if (state is GetUserloaded) {
                    var userse = state.getUser;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DetailProfilePage(
                                      users: userse,
                                    )));
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 30,
                          right: 30,
                          top: 25,
                          bottom: 20,
                        ),
                        margin: EdgeInsets.only(
                          left: defaultMargin,
                          right: defaultMargin,
                          top: 20,
                        ),
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xFF01122B),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(1, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              width: MediaQuery.of(context).size.width / 2 - 45,
                              height: 160,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userse.namaLengkap,
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "17 Tahun",
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Tanding",
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              width:
                                  MediaQuery.of(context).size.width / 2 - 100,
                              height: 130,
                              color: Colors.white,
                              child: Image.asset("assets/programmer.png"),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                top: 40,
              ),
              child: Text(
                "Statistik",
                style: primaryTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 22,
                ),
              ),
            ),
            SizedBox(
              height: 350,
              child: BlocBuilder<GetuserCubit, GetuserState>(
                builder: (context, state) {
                  if (state is GetUserloaded) {
                    List<Statistic> userse = state.getUser.statistic;

                    return Container(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: userse.length,
                          // ignore: missing_return
                          itemBuilder: (_, index) {
                            var stat = userse[index];
                            var ticks = [
                              stat.power.toDouble(),
                              stat.agility.toDouble(),
                              stat.strength.toDouble(),
                            ];

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => StatistikDetail(
                                      stats: stat,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: defaultMargin,
                                  right: defaultMargin,
                                  top: 20,
                                ),
                                width: double.infinity,
                                height: 300,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  // border: Border.all(color: Color(0xFF01122B), width: 2),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(
                                          1, 2), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Center(
                                      child: Container(
                                        width: 100,
                                        height: 190,
                                        child: SpiderChart(
                                          data: ticks,
                                          maxValue:
                                              100, // the maximum value that you want to represent (essentially sets the data scale of the chart)
                                          colors: <Color>[
                                            Colors.red,
                                            Colors.green,
                                            Colors.blue,
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
