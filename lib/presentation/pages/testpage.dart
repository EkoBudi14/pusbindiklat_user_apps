// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestPage extends StatefulWidget {
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  TextEditingController nameController = TextEditingController();

  bool isLoggedIn = false;
  String name = '';

  @override
  void initState() {
    super.initState();
    autoLogIn();
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userId = prefs.getString('username');

    if (userId != null) {
      setState(() {
        isLoggedIn = true;
        name = userId;
      });
      return;
    }
  }

  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', '');

    setState(() {
      name = '';
      isLoggedIn = false;
    });
  }

  Future<Null> loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', nameController.text);

    setState(() {
      name = nameController.text;
      isLoggedIn = true;
    });

    nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auto Login Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            !isLoggedIn
                ? TextField(
                    textAlign: TextAlign.center,
                    controller: nameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Please enter your name'),
                  )
                : Text('You are logged in as $name'),
            SizedBox(height: 10.0),
            // ignore: deprecated_member_use
            RaisedButton(
              onPressed: () {
                isLoggedIn ? logout() : loginUser();
              },
              child: isLoggedIn ? Text('Logout') : Text('Login'),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
