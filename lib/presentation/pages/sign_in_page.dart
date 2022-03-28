// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pusbindiklat_global/presentation/pages/home_page.dart';
import 'package:pusbindiklat_global/presentation/pages/main_page.dart';
import 'package:pusbindiklat_global/styles/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String emailUsers = '';
  String passwords = '';
  String tokens = '';
  String idUsers = '';

  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    autoLogIn();
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String emailUser = prefs.getString('emailUser');
    final String password = prefs.getString('password');
    final String token = prefs.getString('token');

    if (emailUser != null && password != null && token != null) {
      setState(() {
        isLoggedIn = true;
        emailUsers = emailUser;
        passwords = password;
        tokens = token;
      });
      Navigator.push(context, MaterialPageRoute(builder: (_) => MainPage()));
      return;
    }
  }

  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var res = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/logout-api'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${prefs.getString('token')}"
      },
    );

    if (res.statusCode != 200) {
      return null;
    }

    final data = json.decode(res.body);

    prefs.setString('emailUser', '');
    prefs.setString('password', '');
    prefs.setString('token', '');

    setState(() {
      emailUsers = '';
      passwords = '';
      tokens = '';
      isLoggedIn = false;
    });
    print(data);
    return data;
  }

  Future<Null> loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var res = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/login-api'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, dynamic>{
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );

    if (res.statusCode != 200) {
      return null;
    }

    final data = json.decode(res.body);
    prefs.setString('emailUser', emailController.text);
    prefs.setString('password', passwordController.text);
    prefs.setString(
        'token', "Bearer ${data['data']['access_token'].toString()}");

    setState(() {
      emailUsers = emailUsers;
      passwords = passwords;
      tokens = tokens;
      isLoggedIn = true;
    });

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => MainPage()), (route) => false);

    print(data);
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
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
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => SignUpPage()));
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
            // loginUser();
            isLoggedIn ? Container() : loginUser();
            isLoggedIn
                ? Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => MainPage()),
                    (route) => false)
                : Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SignInPage()));
          },
          style: TextButton.styleFrom(
              backgroundColor: Color(0xFF01122B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          child: Text(
            "Belum Masuk",
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
