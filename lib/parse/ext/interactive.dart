import 'package:course_book/config/application.dart';
import 'package:course_book/parse/builder.dart';
import 'package:course_book/utils/log.dart';
import 'package:course_book/utils/util.dart';
import 'package:course_book/utils/widget_util.dart';
import 'package:flutter/material.dart' as Base;

class DefaultClickListener extends EventListener {
  @override
  void onClicked(String event, [dynamic params]) {
    // TODO: implement onClicked
    // Log.v('event: $event ,params: $params');
    Log.v(application.gameContrller.checkAnswer(params));
  }

  @override
  void onCompleted(String event, [dynamic params]) {
    // TODO: implement onCompleted
  }
}

class Button extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
    String clickEvent = CollectionUtil.getValue(data, 'onClick');
    Base.Widget child = buildChild(data['child'], buildContext, listener);
    dynamic params = CollectionUtil.getValue(data, 'params');

    listener = listener ?? DefaultClickListener();
    return Base.GestureDetector(
      child: child,
      onTap: () {
        listener?.onClicked(clickEvent, params);
      },
    );
  }

  @override
  // TODO: implement widgetName
  String get widgetName => "Button";
}

class RadioButton extends Button {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
    // TODO: implement build
    return super.build(data, buildContext, listener);
  }

  @override
  // TODO: implement widgetName
  String get widgetName => "RadioButton";
}

class RadioGroup extends JsonWidget implements EventListener {
  Base.GlobalKey<Base.FormState> _key;
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
    // TODO: implement build
    return buildChild(data['child'], buildContext, this);
  }

  @override
  void onClicked(String event, [params]) {
    // TODO: implement onClicked
    Log.i(params);
  }

  @override
  void onCompleted(String event, [params]) {
    // TODO: implement onCompleted
  }

  @override
  // TODO: implement widgetName
  String get widgetName => "RadioGroup";
}
