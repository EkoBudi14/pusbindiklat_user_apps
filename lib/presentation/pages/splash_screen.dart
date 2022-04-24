// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, use_key_in_widget_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pusbindiklat_global/cubit/getuser_cubit.dart';
import 'package:pusbindiklat_global/cubit/userauth_cubit.dart';
import 'package:pusbindiklat_global/presentation/pages/main_page.dart';
import 'package:pusbindiklat_global/presentation/pages/sign_in_page.dart';
import 'package:pusbindiklat_global/services/local_storage.dart';

String finalEmail;
String finalPassword;
String finalToken;
String finalUid;

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<GetuserCubit>().getUsers();
    Timer(
      Duration(seconds: 3),
      () => loginAuto(),
    );
  }

  Future loginAuto() async {
    finalEmail = await SecureStorage.getEmail();
    finalPassword = await SecureStorage.getPassword();
    finalToken = await SecureStorage.getToken();
    finalUid = await SecureStorage.getUid();
    if (finalToken == null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => SignInPage(),
          ),
          (route) => false);
    } else {
      await context.read<UserauthCubit>().signIn(finalEmail, finalPassword);
      context.read<GetuserCubit>().getUsers();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => MainPage(),
          ),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: Container(
            margin: EdgeInsets.only(
              top: 50,
              bottom: 30,
            ),
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: AssetImage(
                  "assets/logo_ts_bulat.png",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
