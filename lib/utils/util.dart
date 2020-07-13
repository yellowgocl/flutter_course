import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class Util {
  static Future<String> loadAsset(path) async {
    return await rootBundle.loadString(path);
  }
}

class CollectionUtil {
  static dynamic getValue(Map source, dynamic key, [dynamic defaultValue]) {
    if (source == null || source.isEmpty) {
      return null;
    }
    return source.containsKey(key) ? source[key] ?? defaultValue : defaultValue;
  }
}
