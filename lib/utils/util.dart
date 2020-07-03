import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
class Util {
  static Future<String> loadAsset(path) async {
    return await rootBundle.loadString(path);
  }
}