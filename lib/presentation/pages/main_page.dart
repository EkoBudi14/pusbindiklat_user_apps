// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pusbindiklat_global/cubit/getevent_cubit.dart';
import 'package:pusbindiklat_global/presentation/pages/home/date_page.dart';
import 'package:pusbindiklat_global/presentation/pages/home/event_page.dart';
import 'package:pusbindiklat_global/presentation/pages/home/home_page.dart';
import 'package:pusbindiklat_global/presentation/pages/home/scaner_page.dart';
import 'package:pusbindiklat_global/presentation/pages/sign_in_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  String title = 'BottomNavigationBar';

  SharedPreferences sharedPreferences;

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    // checkLoginStatus();
    // BlocProvider.of<GeteventCubit>(context).getEvent();

    _tabController = TabController(length: 3, vsync: this);
  }

  // checkLoginStatus() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   if (sharedPreferences.getString("token") == null &&
  //       sharedPreferences.getString("emailUser") == null &&
  //       sharedPreferences.getString("password") == null) {
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (BuildContext context) => SignInPage()),
  //         (Route<dynamic> route) => false);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: TabBarView(
        children: <Widget>[
          HomePage(),
          ScannerPage(),
          EventPage(),
        ],
        // If you want to disable swiping in tab the use below code
        // physics: NeverScrollableScrollPhysics(),

        controller: _tabController,
      ),
      bottomNavigationBar: Container(
        height: 89,
        padding: EdgeInsets.only(top: 18, bottom: 10, left: 20, right: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            color: Color(0xFF01122B),
            child: TabBar(
              labelColor: Color(0xFFC41A3B),
              unselectedLabelColor: Colors.white,
              labelStyle: TextStyle(fontSize: 10.0),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: Color(0xFF01122B), width: 0.0),
                insets: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 40.0),
              ),
              //For Indicator Show and Customization
              tabs: <Widget>[
                Tab(
                  icon: Container(
                    padding: EdgeInsets.only(
                      top: 5,
                    ),
                    child: Icon(
                      Icons.home,
                      size: 25.0,
                    ),
                  ),
                  text: 'Home',
                ),
                Tab(
                  icon: Container(
                    padding: EdgeInsets.only(
                      top: 5,
                    ),
                    child: Icon(
                      Icons.qr_code,
                      size: 25.0,
                    ),
                  ),
                  text: 'Scan QR',
                ),
                Tab(
                  icon: Container(
                    padding: EdgeInsets.only(
                      top: 5,
                    ),
                    child: Icon(
                      Icons.date_range_outlined,
                      size: 24.0,
                    ),
                  ),
                  text: 'Schedule',
                ),
              ],
              controller: _tabController,
            ),
          ),
        ),
      ),
    );
  }
}
