import 'dart:convert';

import 'package:pusbindiklat_global/models/api_return_value.dart';
import 'package:pusbindiklat_global/models/get_user.dart';
import 'package:http/http.dart' as http;
import 'package:pusbindiklat_global/models/user_login.dart';
import 'package:pusbindiklat_global/services/local_storage.dart';

class GetUserTs {
  static Future<ApiReturnValue<Data>> getUser() async {
    // String idUsers = await SecureStorage.getUid();
    try {
      var res = await http.get(
        Uri.parse("http://pusbindiklat-gemilang.com/api/users/${User.id}"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${User.token}"
        },
      );

      print(res);
      if (res.statusCode != 200) {
        return null;
      }
      var data = jsonDecode(res.body)['data'];

      // var data = jsonDecode(res.body);
      Data value = Data.fromJson(data);
      // String users = data['user'];
      print(data);

      return ApiReturnValue(value: value);
    } catch (e) {
      return null;
    }
  }
}
