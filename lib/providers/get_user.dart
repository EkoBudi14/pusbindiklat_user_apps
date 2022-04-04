import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:pusbindiklat_global/models/get_user.dart';
import 'package:pusbindiklat_global/services/getUser.dart';

class GetUserPusbindiklat extends ChangeNotifier {
  List<Getuser> _users = [];

  List<Getuser> get users => _users;

  set users(List<Getuser> user) {
    _users = user;
    notifyListeners();
  }

  Future<void> getUsersPusPus() async {
    try {
      List<Getuser> users = await GetUserTs().getUser();
      _users = users;
    } catch (e) {
      print(e);
    }
  }
}
