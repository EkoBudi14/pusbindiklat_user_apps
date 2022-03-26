// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:pusbindiklat_global/presentation/pages/detail_profile_page.dart';
import 'package:pusbindiklat_global/presentation/pages/statistik_detail.dart';
import 'package:pusbindiklat_global/styles/style.dart';
import 'package:spider_chart/spider_chart.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const ticks = [
      100.0,
      90.0,
      80.0,
      70.0,
      60.0,
      50.0,
    ];
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo_ts_bulat.png',
              width: 50,
            ),
          ],
        ),
        toolbarHeight: 70,
        actions: [
          IconButton(
            onPressed: () => {},
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
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => DetailProfilePage()));
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
                      offset: Offset(1, 2), // changes position of shadow
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
                            "Eko Budiarto",
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
                      width: MediaQuery.of(context).size.width / 2 - 100,
                      height: 130,
                      color: Colors.white,
                      child: Image.asset("assets/programmer.png"),
                    ),
                  ],
                ),
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
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => StatistikDetail()));
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
                      offset: Offset(1, 2), // changes position of shadow
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
                            Colors.yellow,
                            Colors.indigo,
                            Colors.black,
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
            ),
            SizedBox(
              height: 95,
            ),
          ],
        ),
      ),
    );
  }
}
