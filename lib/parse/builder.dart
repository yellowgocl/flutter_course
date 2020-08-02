import 'dart:convert';

import 'package:course_book/parse/common/widget.dart';
import 'package:course_book/parse/common/container.dart';
import 'package:course_book/parse/common/text.dart';
import 'package:course_book/parse/ext/flare.dart';
import 'package:course_book/utils/log.dart';
import 'package:course_book/utils/util.dart';
import 'package:course_book/utils/widget_util.dart';
import 'package:flutter/material.dart' as Base;

class BaseWidgetBuilder {
  static bool _inited = false;
  static final _widgetBuilders = <String, BaseWidget>{};
  static final _builders = [
    // containers
    Container(),
    ConstrainedBox(),
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
  ];
  static void addBuilder(BaseWidget parser) {
    // Log.i(
    //     "add custom widget parser, make sure you don't overwirte the widget type.");
    _builders.add(parser);
    _widgetBuilders[parser.widgetName] = parser;
  }

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

  Base.Widget buildChild(
      T data, Base.BuildContext buildContext, EventListener listener);

  List<Base.Widget> buildChildren(
      T data, Base.BuildContext buildContext, EventListener listener);
}

abstract class JsonWidget extends BaseWidget<Map<String, dynamic>> {
  @override
  Base.Widget buildChild(Map<String, dynamic> data,
      Base.BuildContext buildContext, EventListener listener) {
    // TODO: implement buildChild
    return WidgetUtil.parseChild(data, buildContext, listener);
  }

  @override
  List<Base.Widget> buildChildren(Map<String, dynamic> data,
      Base.BuildContext buildContext, EventListener listener) {
    // TODO: implement buildChildren
    // return WidgetUtil.parseChildren(data['children'], buildContext, listener);
    List<dynamic> children = CollectionUtil.getValue(data, 'children');
    List<Base.Widget> result = [];
    if (children != null && children.isNotEmpty) {
      children.forEach((element) {
        Base.Widget child = buildChild(element, buildContext, listener);
        if (child != null) {
          result.add(child);
        }
      });
    }
    return result;
  }
}

abstract class EventListener {
  void onClicked(String event, [dynamic params]);
  void onCompleted(String event, [dynamic params]);
}

class DefaultWidgetEventListener extends EventListener {
  @override
  void onClicked(String event, [dynamic params]) {
    // TODO: implement onClicked
    Log.v('receiver onclick: $event');
  }

  @override
  void onCompleted(String event, [dynamic params]) {
    // TODO: implement onCompleted
    Log.v('receiver oncomplete: $event');
  }
}
