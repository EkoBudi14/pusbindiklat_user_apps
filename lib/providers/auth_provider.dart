// import 'dart:collection';

// import 'package:flutter/cupertino.dart';
// import 'package:pusbindiklat_global/models/user_login.dart';
// import 'package:pusbindiklat_global/services/auth_services.dart';
// import 'package:pusbindiklat_global/services/local_storage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// String passwords = '';
// String emails = '';

// class AuthProvider extends ChangeNotifier {
//   User _user;

//   User get user => _user;
//   set user(User user) {
//     _user = user;
//     notifyListeners();
//   }

//   Future<bool> login(
//     String email,
//     String password,
//   ) async {
//     try {
//       User user = await AuthServices().loginUser(
//         email: email,
//         password: password,
//       );

//       _user = user;
//       notifyListeners();

//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   Future<bool> logOut() async {
//     try {
//       AuthServices().logOut();
//       await SecureStorage.removeToken();
//       return true;
//     } catch (e) {
//       print("Gagal Log out");
//       return false;
//     }
//   }

//   Future<bool> signUp(
//     String email,
//     String namaLengkap,
//     String password,
//     String alamat,
//     String tanggalLahir,
//   ) async {
//     try {
//       User user = await AuthServices().signUpUser(
//         email: email,
//         password: password,
//         namaLengkap: namaLengkap,
//         alamat: alamat,
//         tanggalLahir: tanggalLahir,
//       );

//       _user = user;
//       notifyListeners();

//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }
// }
