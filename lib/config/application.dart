import 'package:course_book/config/routes.dart';
import 'package:course_book/core/gameController.dart';
import 'package:course_book/http/request.dart';
import 'package:course_book/parse/builder.dart';
import 'package:course_book/parse/ext/flare.dart';
import 'package:course_book/parse/ext/interactive.dart';
import 'package:fluro/fluro.dart';

import 'package:course_book/env/env.dart';
import 'package:course_book/utils/log.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../env/index.dart';

Map<String, Env> envMap = {
  "dev": Env.fromJson(devConfig),
  "prod": Env.fromJson(prodConfig)
};

class Application {
  Router router = Router();
  GameContrller gameContrller;
  String _secretKey;
  Request request;
  Env env;
  bool inited = false;
  static final _instance = new Application._internal();
  factory Application() {
    return _instance;
  }
  Application._internal();

  static Application get instance {
    return new Application();
  }

  String get secretKey {
    return _secretKey == null ? "2k762g1o8ywfu7bh2dby" : _secretKey;
  }

  set secretKey(String val) {
    _secretKey = val;
  }

  void addExtBuilders() {
    BaseWidgetBuilder.addBuilder(FlareActor());
    BaseWidgetBuilder.addBuilder(Button());
    BaseWidgetBuilder.addBuilder(RadioButton());
    BaseWidgetBuilder.addBuilder(RadioGroup());
  }

  Future<bool> initialize(
      {String envSign = 'dev', GameContrller gameContrller}) async {
    this.gameContrller = gameContrller;
    if (!inited) {
      addExtBuilders();
      ScreenUtil.init(width: 750, height: 1334, allowFontScaling: true);
      RoutesController.configureRoutes(router);
      inited = true;
      env = envMap.containsKey(envSign) ? envMap[envSign] : envMap['dev'];
      Http.init(baseUrl: env.host);
      Log.init(debug: !(envSign == 'prod'));
      this.request = Http;
    }
    return inited;
  }
}

final Application application = Application.instance;
