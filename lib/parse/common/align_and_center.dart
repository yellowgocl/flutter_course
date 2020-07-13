import 'package:course_book/parse/builder.dart';
import 'package:course_book/utils/widgetUtil.dart';
import 'package:flutter/widgets.dart' as Base;
import 'package:flutter/widgets.dart';

class Align extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      ClickListener listener) {
    // TODO: implement build
    Base.Widget child =
        WidgetUtil.parseChild(data['child'], buildContext, listener);
    return Base.Align(
      key: WidgetUtil.parseKey(data['key']),
      child: child,
      alignment: WidgetUtil.parseAlignment(data['alignment']),
      widthFactor: WidgetUtil.parseDouble(data['widthFactor']),
      heightFactor: WidgetUtil.parseDouble(data['heightFactor']),
    );
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'Align';
}

class Center extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      ClickListener listener) {
    // TODO: implement build
    Base.Widget child =
        WidgetUtil.parseChild(data['child'], buildContext, listener);
    return Base.Center(
      key: WidgetUtil.parseKey(data['key']),
      child: child,
      widthFactor: WidgetUtil.parseDouble(data['widthFactor']),
      heightFactor: WidgetUtil.parseDouble(data['heightFactor']),
    );
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'Center';
}

class Stack extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      ClickListener listener) {
    // TODO: implement build

    return Base.Stack(
      key: WidgetUtil.parseKey(data['key']),
      alignment: WidgetUtil.parseAlignment(
          data['alignment'], AlignmentDirectional.topStart),
      textDirection: WidgetUtil.parseTextDirection(data['textDirection']),
      fit: WidgetUtil.parseStackFit(data['fit'], StackFit.loose),
      overflow: WidgetUtil.parseOverflow(data['overflow']),
      children:
          WidgetUtil.parseChildren(data['children'], buildContext, listener),
    );
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'Stack';
}

class Positioned extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      ClickListener listener) {
    // TODO: implement build
    return Base.Positioned(
      key: WidgetUtil.parseKey(data['key']),
      top: WidgetUtil.parseDouble(data['top']),
      right: WidgetUtil.parseDouble(data['right']),
      bottom: WidgetUtil.parseDouble(data['bottom']),
      left: WidgetUtil.parseDouble(data['left']),
      width: WidgetUtil.parseWidth(data['width']),
      height: WidgetUtil.parseHeight(data['height']),
      child: WidgetUtil.parseChild(data['child'], buildContext, listener),
    );
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'Positioned';
}
