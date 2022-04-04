// // // ignore_for_file: use_key_in_widget_constructors

// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class TestPage extends StatefulWidget {
// //   @override
// //   State<TestPage> createState() => _TestPageState();
// // }

// // class _TestPageState extends State<TestPage> {
// //   TextEditingController nameController = TextEditingController();

// //   bool isLoggedIn = false;
// //   String name = '';

// //   @override
// //   void initState() {
// //     super.initState();
// //     autoLogIn();
// //   }

// //   void autoLogIn() async {
// //     final SharedPreferences prefs = await SharedPreferences.getInstance();
// //     final String userId = prefs.getString('username');

// //     if (userId != null) {
// //       setState(() {
// //         isLoggedIn = true;
// //         name = userId;
// //       });
// //       return;
// //     }
// //   }

// //   Future<Null> logout() async {
// //     final SharedPreferences prefs = await SharedPreferences.getInstance();
// //     prefs.setString('username', '');

// //     setState(() {
// //       name = '';
// //       isLoggedIn = false;
// //     });
// //   }

// //   Future<Null> loginUser() async {
// //     final SharedPreferences prefs = await SharedPreferences.getInstance();
// //     prefs.setString('username', nameController.text);

// //     setState(() {
// //       name = nameController.text;
// //       isLoggedIn = true;
// //     });

// //     nameController.clear();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Auto Login Home Page'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             !isLoggedIn
// //                 ? TextField(
// //                     textAlign: TextAlign.center,
// //                     controller: nameController,
// //                     decoration: InputDecoration(
// //                         border: InputBorder.none,
// //                         hintText: 'Please enter your name'),
// //                   )
// //                 : Text('You are logged in as $name'),
// //             SizedBox(height: 10.0),
// //             // ignore: deprecated_member_use
// //             RaisedButton(
// //               onPressed: () {
// //                 isLoggedIn ? logout() : loginUser();
// //               },
// //               child: isLoggedIn ? Text('Logout') : Text('Login'),
// //             )
// //           ],
// //         ),
// //       ), // This trailing comma makes auto-formatting nicer for build methods.
// //     );
// //   }
// // }


//  SharedPreferences sharedPreferences;

//   String emailUsers = '';
//   String passwords = '';
//   String tokens = '';
//   String idUsers = '';
//   bool isLogin = false;

//   Future logOut() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final String token = prefs.getString('token');

//     var res = await http.post(
//       Uri.parse('http://10.0.2.2:8000/api/logout-api'),
//       headers: {
//         "Content-Type": "application/json",
//         "Authorization": "Bearer $token"
//       },
//     );

//     if (res.statusCode != 200) {
//       return null;
//     }

//     final data = json.decode(res.body);

//     isLogin = false;
//     emailUsers = '';
//     passwords = '';
//     tokens = '';

//     setState(() {
//       prefs.clear();
//       prefs.commit();
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (BuildContext context) => SignInPage()),
//       );
//     });

//     print(data);
//     return data;
//   }



  // void autoLogIn() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String token = prefs.getString('token');

  //   if (token != null) {
  //     setState(() {
  //       isLoggedIn = true;
  //       tokens = token;
  //     });
  //     Navigator.pushAndRemoveUntil(context,
  //         MaterialPageRoute(builder: (_) => MainPage()), (route) => false);
  //     return;
  //   }
  // }