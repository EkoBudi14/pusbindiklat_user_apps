import 'dart:convert';

import 'package:pusbindiklat_global/models/get_user.dart';
import 'package:http/http.dart' as http;
import 'package:pusbindiklat_global/models/user_login.dart';

class GetUserTs {
  Future<List<Getuser>> getUser() async {
    try {
      var res = await http.get(
        Uri.parse("http://tssabes.my.id/api/users"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${User.token}"
        },
      );

      print(res);
      if (res.statusCode != 200) {
        return null;
      }

      List data = jsonDecode(res.body)['0'];

      List<Getuser> getUserTsPus = [];
      for (var item in data) {
        getUserTsPus.add(Getuser.fromJson(item));
      }

      return getUserTsPus;
    } catch (e) {
      return null;
    }
  }
}
