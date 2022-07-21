import 'dart:async';
import 'dart:convert';

import 'package:pusbindiklat_global/models/api_return_value.dart';
import 'package:pusbindiklat_global/models/event.dart';
import 'package:http/http.dart' as http;
import 'package:pusbindiklat_global/models/model_event.dart';

class GetEventSilat {
  // Future<List<Event>> getEvent(int page) async {
  //   try {
  //     var res = await http.get(
  //       Uri.parse("http://pusbindiklat-gemilang.com/api/event?page=$page"),
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //     );

  //     print(res);
  //     if (res.statusCode != 200) {
  //       return null;
  //     }

  //     var data = jsonDecode(res.body);

  //     print(data);

  //     List<Event> value = (data['data']['data'] as Iterable)
  //         .map((e) => Event.fromJson(e))
  //         .toList();

  //     return value;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  static Future<ApiReturnValue<List<Event>>> getEvent() async {
    var res = await http.get(
      Uri.parse("http://pusbindiklat-gemilang.com/api/event?limit=10"),
      headers: {
        "Content-Type": "application/json",
      },
    );

    print(res);
    if (res.statusCode != 200) {
      return null;
    }

    var data = jsonDecode(res.body);

    print(data);

    List<Event> value = (data['data']['data'] as Iterable)
        .map((e) => Event.fromJson(e))
        .toList();
    // _streamController.sink.add(value);

    return ApiReturnValue(value: value);
  }
}
