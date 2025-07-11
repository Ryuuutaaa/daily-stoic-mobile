import 'dart:convert';

import 'package:flutter/services.dart';

class JsonService {
  static Future<List<dynamic>> loadData(String path) async {
    final String jsonString = await rootBundle.loadString(path);
    return jsonDecode(jsonString) as List<dynamic>;
  }
}
