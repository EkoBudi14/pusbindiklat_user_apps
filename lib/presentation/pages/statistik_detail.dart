// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:pusbindiklat_global/models/statistic.dart';
import 'package:pusbindiklat_global/styles/style.dart';
import 'package:spider_chart/spider_chart.dart';

class StatistikDetail extends StatelessWidget {
  final Statistic stats;
  StatistikDetail({this.stats});
  @override
  Widget build(BuildContext context) {
    var ticks = [
      stats.strength.toDouble(),
      stats.agility.toDouble(),
      stats.power.toDouble(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Statistik Detail",
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
        child: Container(
          color: Colors.white,
          height: 700,
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 30),
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
                height: 25,
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 18,
                            height: 18,
                            color: Colors.red,
                          ),
                          Text(
                            " : Streng",
                            style: primaryTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 18,
                            height: 18,
                            color: Colors.red,
                          ),
                          Text(
                            " : Streng",
                            style: primaryTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 18,
                            height: 18,
                            color: Colors.red,
                          ),
                          Text(
                            " : Streng",
                            style: primaryTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 18,
                            height: 18,
                            color: Colors.red,
                          ),
                          Text(
                            " : Streng",
                            style: primaryTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 18,
                            height: 18,
                            color: Colors.red,
                          ),
                          Text(
                            " : Streng",
                            style: primaryTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 18,
                            height: 18,
                            color: Colors.red,
                          ),
                          Text(
                            " : Streng",
                            style: primaryTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
