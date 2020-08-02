import 'dart:async' show Future;
import 'package:course_book/core/enums.dart';
import 'package:course_book/model/course/course.dart';
import 'package:flutter/services.dart' show rootBundle;

class Util {
  static Future<String> loadAsset(path) async {
    return await rootBundle.loadString(path);
  }

  static PointType parsePointType(dynamic value, [PointType defaultValue]) {
    PointType result = defaultValue;
    if (value == 0 || value == 'speech') {
      result = PointType.speech;
    } else if (value == 1 || value == 'answer') {
      result = PointType.answer;
    } else if (value == 2 || value == 'report') {
      result = PointType.report;
    }
    return result;
  }

  static int composePointType(PointType value, [int defaultValue]) {
    int result = defaultValue;
    if (value != null) {
      result = value.index;
    }
    return result;
  }

  static Duration parseDuration(dynamic value, [Duration defaultValue]) {
    Duration result = defaultValue;
    if (value is Duration) {
      result = value;
    } else if (value is int) {
      result = Duration(milliseconds: value);
    }
    return result;
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

class GameUtil {}
