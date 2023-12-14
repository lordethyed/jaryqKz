import 'dart:convert';

import 'package:flutter/services.dart';

class MyJsonClient {
  Future<Map<String, dynamic>> getJsonObject(String path) async {
    final response = await rootBundle.loadString(path);
    final jsonBody = json.decode(response);
    return jsonBody;
  }

  Future<List<dynamic>> getJsonList(String path) async {
    final response = await rootBundle.loadString(path);
    final jsonBody = json.decode(response);
    return jsonBody;
  }
}