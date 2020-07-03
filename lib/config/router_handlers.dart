
import 'package:course_book/pages/home.dart';
import 'package:course_book/pages/login.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';

var HomeHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});

var LoginHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});