import 'dart:convert';

import 'package:course_book/parse/common/align_and_center.dart';
import 'package:course_book/parse/common/container.dart';
import 'package:course_book/parse/common/text.dart';
import 'package:course_book/utils/log.dart';
import 'package:flutter/widgets.dart' as Base;

class BaseWidgetBuilder {
  static bool _inited = false;
  static final _widgetBuilders = <String, BaseWidget>{};
  static final _builders = [
    Container(),
    Text(),
    RichText(),
    Align(),
    Center(),
    Flex(),
    Row(),
    Column(),
    Expanded(),
    Stack(),
    Positioned(),
    SizedBox(),
    ExpandedSizedBox(),
    SafeArea(),
    Padding(),
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
      [ClickListener listener]) {
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
      [ClickListener listener]) {
    initDefaultBuilders();
    ClickListener _listener =
        listener == null ? DefaultWidgetOnClickListener() : listener;
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
      T data, Base.BuildContext buildContext, ClickListener listener);
  String get widgetName;
}

abstract class JsonWidget extends BaseWidget<Map<String, dynamic>> {}

abstract class ClickListener {
  void onClicked(String event);
}

class DefaultWidgetOnClickListener extends ClickListener {
  @override
  void onClicked(String event) {
    // TODO: implement onClicked
    Log.v('receiver onclick: $event');
  }
}
