// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pusbindiklat_global/cubit/userauth_cubit.dart';
import 'package:pusbindiklat_global/models/user_login.dart';
import 'package:pusbindiklat_global/presentation/pages/home/home_page.dart';
import 'package:pusbindiklat_global/presentation/pages/main_page.dart';
import 'package:pusbindiklat_global/presentation/pages/sign_up_page.dart';
import 'package:pusbindiklat_global/providers/auth_provider.dart';
import 'package:pusbindiklat_global/services/auth_services.dart';
import 'package:pusbindiklat_global/services/local_storage.dart';
import 'package:pusbindiklat_global/styles/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String tokens = '';

  bool isLoggedIn = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);

    // void login() async {
    //   setState(() {
    //     isLoading = true;
    //   });

    //   if (await authProvider.login(
    //     emailController.text,
    //     passwordController.text,
    //   )) {
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (_) => MainPage()),
    //     );
    //   } else {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         backgroundColor: Colors.red,
    //         content: Text(
    //           'Gagal Login!',
    //           textAlign: TextAlign.center,
    //         ),
    //       ),
    //     );
    //   }

    //   setState(() {
    //     isLoading = false;
    //   });
    // }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(
          left: 30,
          right: 30,
          bottom: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Selamat Datang\nSilahkan Login",
              style: primaryTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 14,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Color(0xffE1E1E1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Color(0xFF01122B),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukan Email Anda',
                          hintStyle: primaryTextStyle.copyWith(
                            fontSize: 14,
                            color: Color(0xffA39C9C),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Password",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Color(0xffE1E1E1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.lock,
                      color: Color(0xFF01122B),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukan Password Anda',
                          hintStyle: primaryTextStyle.copyWith(
                            fontSize: 14,
                            color: Color(0xffA39C9C),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget forgotPassword() {
      return Container(
        margin: EdgeInsets.only(top: 12),
        child: Row(
          children: [
            Text(
              "Apakah Anda Lupa Password ?",
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              width: 3,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => ForgotPasssword()));
              },
              child: Text(
                "Klik Disini",
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: bold,
                  color: primaryColor,
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget signUp() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 16,
        ),
        // ignore: deprecated_member_use
        child: OutlineButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpPage()));
          },
          borderSide: BorderSide(color: Color(0xFF01122B), width: 2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Text(
            "Daftar",
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
              color: Color(0xFF01122B),
            ),
          ),
        ),
      );
    }

    Widget btnSignIn() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: TextButton(
          onPressed: () async {
            setState(() {
              isLoading = true;
            });

            await context
                .read<UserauthCubit>()
                .signIn(emailController.text, passwordController.text);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => MainPage()),
            );

            setState(() {
              isLoading = false;
            });
          },
          style: TextButton.styleFrom(
              backgroundColor: Color(0xFF01122B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          child: Text(
            "Masuk",
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
              ],
            ),
            title(),
            emailInput(),
            passwordInput(),
            // forgotPassword(),
            btnSignIn(),
            signUp(),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          content(),
        ],
      ),
    );
  }
}
