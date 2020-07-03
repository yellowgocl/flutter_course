import 'dart:convert';

import 'package:course_book/config/application.dart';
import 'package:course_book/model/auth.dart';
import 'package:course_book/utils/log.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class Url{
  String path;
  String method;
  Url(this.path, this.method);
}
final Map<String, Url> _urls = {
  'auth': Url('/auth/v1/authorize/application/', 'GET')
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
    return application.request.get<Auth>(url: url, tag: url, parse: (v) => Auth.fromJson(v));
  }
}