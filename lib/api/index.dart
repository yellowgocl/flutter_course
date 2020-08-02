import 'dart:convert';

import 'package:course_book/config/application.dart';
import 'package:course_book/model/auth.dart';
import 'package:course_book/model/course/course.dart';
import 'package:course_book/utils/log.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Url {
  String path;
  String method;
  Url(this.path, this.method);
}

final Map<String, Url> _urls = {
  'auth': Url('/auth/v1/authorize/application/', 'GET'),
  'get_course': Url('/auth/v1/authorize/application/', 'GET'),
  'post_gop_speech': Url('http://47.106.80.82:9005/evaluating', 'POST'),
  'post_gop_reply': Url('http://47.106.80.82:9005/qanda', 'POST'),
};

class Api {
  static Map<String, Url> urls = _urls;

  static Future<Auth> auth() {
    // /v1/authorize/application/{id}/{sign}/{timestamp}
    String url = urls['auth']?.path;
    String appId = application.env.appId;
    var formatter = new DateFormat('yyyyMMddHHmmssSSS');
    String timestamp = formatter.format(new DateTime.now());
    timestamp = '20200701152337198';
    String str = "id" + appId + "timestamp" + timestamp;
    List<int> strBytes = utf8.encode(str);
    List<int> keyBytes = utf8.encode(application.secretKey);
    Hmac hmacSha1 = new Hmac(sha1, keyBytes); // HMAC-SHA256
    Digest hmac = hmacSha1.convert(strBytes);
    String sign = (base64Encode(hmac.bytes));
    url = '$url$appId/$sign/$timestamp';
    return application.request
        .get<Auth>(url: url, tag: url, parse: (v) => Auth.fromJson(v));
  }

  static Future<Course> fetchCourse() async {
    String url = urls['get_course'].path;
    Map<String, dynamic> res =
        (jsonDecode(await rootBundle.loadString('assets/data/course.json')));
    //Log.i(res['data']);
    return Course.fromJson(res['data']);
  }
}
