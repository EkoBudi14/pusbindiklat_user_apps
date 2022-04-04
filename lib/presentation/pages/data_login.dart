  // bool isLoggedIn = false;

  // @override
  // void initState() {
  //   super.initState();
  //   autoLogIn();
  // }

  // void autoLogIn() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String emailUser = prefs.getString('emailUser');
  //   final String password = prefs.getString('password');
  //   final String token = prefs.getString('token');

  //   if (emailUser != null && password != null && token != null) {
  //     setState(() {
  //       isLoggedIn = true;
  //       emailUsers = emailUser;
  //       passwords = password;
  //       tokens = token;
  //     });
  //     Navigator.push(context, MaterialPageRoute(builder: (_) => MainPage()));
  //     return;
  //   }
  // }

  // Future<Null> logout() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var res = await http.post(
  //     Uri.parse('http://10.0.2.2:8000/api/logout-api'),
  //     headers: {
  //       "Content-Type": "application/json",
  //       "Authorization": "Bearer ${prefs.getString('token')}"
  //     },
  //   );

  //   if (res.statusCode != 200) {
  //     return null;
  //   }

  //   final data = json.decode(res.body);

  //   prefs.setString('emailUser', '');
  //   prefs.setString('password', '');
  //   prefs.setString('token', '');

  //   setState(() {
  //     emailUsers = '';
  //     passwords = '';
  //     tokens = '';
  //     isLoggedIn = false;
  //   });
  //   print(data);
  //   return data;
  // }

  // Future<Null> loginUser() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var res = await http.post(
  //     Uri.parse('http://10.0.2.2:8000/api/login-api'),
  //     headers: {"Content-Type": "application/json"},
  //     body: jsonEncode(<String, dynamic>{
  //       'email': emailController.text,
  //       'password': passwordController.text,
  //     }),
  //   );

  //   if (res.statusCode != 200) {
  //     return null;
  //   }

  //   final data = json.decode(res.body);
  //   prefs.setString('emailUser', emailController.text);
  //   prefs.setString('password', passwordController.text);
  //   prefs.setString(
  //       'token', "Bearer ${data['data']['access_token'].toString()}");

  //   setState(() {
  //     emailUsers = emailUsers;
  //     passwords = passwords;
  //     tokens = tokens;
  //     isLoggedIn = true;
  //   });

  //   Navigator.pushAndRemoveUntil(context,
  //       MaterialPageRoute(builder: (_) => MainPage()), (route) => false);

  //   print(data);
  //   emailController.clear();
  //   passwordController.clear();
  // }



            //   isLoggedIn ? Container() : loginUser();
            // isLoggedIn
            //     ? Navigator.pushAndRemoveUntil(
            //         context,
            //         MaterialPageRoute(builder: (_) => MainPage()),
            //         (route) => false)
            //     : Navigator.push(
            //         context, MaterialPageRoute(builder: (_) => SignInPage()));



  //           String emailUsers = '';
  // String passwords = '';
  // String tokens = '';
  // String idUsers = '';


  // String emailUsers = '';
  // String passwords = '';
  // String tokens = '';
  // String idUsers = '';

  // bool isLoggedIn = false;

  // @override
  // void initState() {
  //   super.initState();
  //   autoLogIn();
  // }

  // void autoLogIn() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String emailUser = prefs.getString('emailUser');
  //   final String password = prefs.getString('password');
  //   final String token = prefs.getString('token');

  //   if (emailUser != null && password != null && token != null) {
  //     setState(() {
  //       isLoggedIn = true;
  //       emailUsers = emailUser;
  //       passwords = password;
  //       tokens = token;
  //     });
  //     Navigator.push(context, MaterialPageRoute(builder: (_) => MainPage()));
  //     return;
  //   }
  // }

  // Future<Null> loginUser() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var res = await http.post(
  //     Uri.parse('http://10.0.2.2:8000/api/login-api'),
  //     headers: {"Content-Type": "application/json"},
  //     body: jsonEncode(<String, dynamic>{
  //       'email': emailController.text,
  //       'password': passwordController.text,
  //     }),
  //   );

  //   if (res.statusCode != 200) {
  //     return null;
  //   }

  //   final data = json.decode(res.body);
  //   prefs.setString('emailUser', emailController.text);
  //   prefs.setString('password', passwordController.text);
  //   prefs.setString(
  //       'token', "Bearer ${data['data']['access_token'].toString()}");

  //   setState(() {
  //     emailUsers = emailUsers;
  //     passwords = passwords;
  //     tokens = tokens;
  //     isLoggedIn = true;
  //   });

  //   Navigator.pushAndRemoveUntil(context,
  //       MaterialPageRoute(builder: (_) => MainPage()), (route) => false);

  //   print(data);
  //   emailController.clear();
  //   passwordController.clear();
  // }


  // isLoggedIn ? Container() : loginUser();
  //           isLoggedIn
  //               ? Navigator.pushAndRemoveUntil(
  //                   context,
  //                   MaterialPageRoute(builder: (_) => MainPage()),
  //                   (route) => false)
  //               : Navigator.push(
  //                   context, MaterialPageRoute(builder: (_) => SignInPage()));
  //           CircularProgressIndicator();