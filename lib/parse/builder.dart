import 'dart:convert';

import 'package:course_book/parse/common/widget.dart';
import 'package:course_book/parse/common/container.dart';
import 'package:course_book/parse/common/text.dart';
import 'package:course_book/parse/ext/flare.dart';
import 'package:course_book/utils/log.dart';
import 'package:flutter/widgets.dart' as Base;

class BaseWidgetBuilder {
  static bool _inited = false;
  static final _widgetBuilders = <String, BaseWidget>{};
  static final _builders = [
    // containers
    Container(),
    Align(),
    Center(),
    Flex(),
    Row(),
    Column(),
    Expanded(),
    Stack(),
    IndexedStack(),
    Positioned(),
    SizedBox(),
    ExpandedSizedBox(),
    SafeArea(),
    Padding(),
    // widgets
    Text(),
    RichText(),
    Opacity(),
    Icon(),
    Image(),
    AspectRatio(),
    Baseline(),
    RaisedButton(),

    //ext
    FlareActor()
  ];

  static void initDefaultBuilders() {
    if (!_inited) {
      for (BaseWidget builder in _builders) {
        _widgetBuilders[builder.widgetName] = builder;
      }
      _inited = true;
    }
  }

  static Base.Widget build(String json, Base.BuildContext buildContext,
      [EventListener listener]) {
    assert(json != null);
    if (json != null) {
      Map<String, dynamic> data = jsonDecode(json);
      return buildFromMap(data, buildContext, listener);
    } else {
      throw ArgumentError.notNull('json');
    }
  }

  static Base.Widget buildFromMap(
      Map<String, dynamic> source, Base.BuildContext buildContext,
      [EventListener listener]) {
    initDefaultBuilders();
    EventListener _listener =
        listener == null ? DefaultWidgetEventListener() : listener;
    String widgetName = source['widgetName'];
    BaseWidget builder = _widgetBuilders[widgetName];
    if (builder != null) {
      return builder.build(source, buildContext, _listener);
    }
    Log.w('Not support type of {$widgetName}');
    return null;
  }
}

abstract class BaseWidget<T> {
  Base.Widget build(
      T data, Base.BuildContext buildContext, EventListener listener);
  String get widgetName;
}

abstract class JsonWidget extends BaseWidget<Map<String, dynamic>> {}

abstract class EventListener {
  void onClicked(String event);
  void onCompleted(String event);
}

class DefaultWidgetEventListener extends EventListener {
  @override
  void onClicked(String event) {
    // TODO: implement onClicked
    Log.v('receiver onclick: $event');
  }

  @override
  void onCompleted(String event) {
    // TODO: implement onCompleted
    Log.v('receiver oncomplete: $event');
  }
}
