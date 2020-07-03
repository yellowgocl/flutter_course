import 'package:course_book/config/router_handlers.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class RoutesController {
  static String root = '/';
  static String login = '/login';

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>>params) {
      print('404 page not found!');
    });
    router.define(root, handler: HomeHandler);
    router.define(login, handler: LoginHandler);
  }
}