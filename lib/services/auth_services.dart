// ignore_for_file: unused_catch_clause

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pusbindiklat_global/models/api_return_value.dart';
import 'package:pusbindiklat_global/models/user_login.dart';
import 'package:pusbindiklat_global/services/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as Dio;

class AuthServices {
  // Uri.parse('http://10.0.2.2:8000/api/login-api')

  String finalToken;

  // Future<User> loginUser({String email, String password}) async {
  //   try {
  //     var res = await http.post(
  //       Uri.parse('http://tssabes.my.id/api/login-api'),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode(<String, dynamic>{
  //         'email': email,
  //         'password': password,
  //       }),
  //     );

  //     if (res.statusCode != 200) {
  //       return null;
  //     }
  //     final data = json.decode(res.body);
  //     User user = User.fromJson(data['data']['user']);
  //     user.id = data['data']['user']['id'];

  //     User.token = "Bearer ${data['data']['access_token'].toString()}";
  //     await SecureStorage.setEmail(email);
  //     await SecureStorage.setPassword(password);
  //     await SecureStorage.setToken(User.token);
  //     await SecureStorage.setUid(user.id.toString());
  //     print(data);
  //     return user;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  // Future logOut() async {
  //   finalToken = await SecureStorage.getToken();

  //   var res = await http.post(
  //     Uri.parse('http://tssabes.my.id/api/logout-api'),
  //     headers: {
  //       "Content-Type": "application/json",
  //       "Authorization": "Bearer $finalToken"
  //     },
  //   );

  //   if (res.statusCode != 200) {
  //     return null;
  //   }

  //   final data = json.decode(res.body);

  //   print(data);
  //   return data;
  // }

  // Future<User> signUp({
  //   String email,
  //   String password,
  //   String namaLengkap,
  //   String alamat,
  //   String tanggalLahir,
  // }) async {
  //   try {
  //     var res = await http.post(
  //       Uri.parse('http://tssabes.my.id/api/register-api'),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode(<String, dynamic>{
  //         'email': email,
  //         'password': password,
  //         'tanggalLahir': tanggalLahir,
  //         'namaLengkap': namaLengkap,
  //         'alamat': alamat,
  //       }),
  //     );

  //     if (res.statusCode != 200) {
  //       return null;
  //     }
  //     final data = json.decode(res.body);
  //     User user = User.fromJson(data['data']['user']);

  //     User.token = "Bearer ${data['data']['access_token'].toString()}";
  //     await SecureStorage.setEmail(email);
  //     await SecureStorage.setPassword(password);
  //     await SecureStorage.setToken(User.token);
  //     print(data);
  //     return user;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  static Future<ApiReturnValue<User>> signUpUser(User user, String password,
      {http.Client client}) async {
    // ignore: prefer_conditional_assignment
    if (client == null) {
      client = http.Client();
    }

    var response = await client.post(
      Uri.parse('http://tssabes.my.id/api/register-api'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, dynamic>{
        'email': user.email,
        'password': password,
        'tanggalLahir': user.tanggalLahir,
        'namaLengkap': user.namaLengkap,
        'alamat': user.alamat,
      }),
    );

    if (response.statusCode != 200) {
      return null;
    }

    var data = jsonDecode(response.body);
    User.token = data['data']['access_token'];
    User.id = data['data']['user']['id'];
    // String users = data['user'];

    User value = User.fromJson(data['data']['user']);

    await SecureStorage.setEmail(user.email);
    await SecureStorage.setPassword(password);
    await SecureStorage.setToken(User.token);
    await SecureStorage.setUid(User.id.toString());

    print(data);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<User>> signIn(String email, String password,
      {http.Client client}) async {
    client ??= http.Client();
    User user;

    var response =
        await client.post(Uri.parse("http://tssabes.my.id/api/login-api"),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(<String, String>{
              'email': email,
              'password': password,
            }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    String token = data['data']['access_token'].toString();
    User.id = data['data']['user']['id'];
    // String users = data['user'];
    User.token = token;

    User value = User.fromJson(data['data']['user']);

    User.token = "Bearer ${data['data']['access_token'].toString()}";
    await SecureStorage.setEmail(email);
    await SecureStorage.setPassword(password);
    await SecureStorage.setToken(token);
    await SecureStorage.setUid(User.id.toString());
    print(data);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<bool>> signOut({http.Client client}) async {
    client ??= http.Client();

    var response = await client
        .post(Uri.parse('http://tssabes.my.id/api/logout-api'), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${User.token}"
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    await SecureStorage.removeToken();

    bool value = data['data'];

    print(data);

    return ApiReturnValue(value: value);
  }
}
