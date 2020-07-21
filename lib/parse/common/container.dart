import 'package:course_book/parse/builder.dart';
import 'package:course_book/utils/widget_util.dart';
import 'package:flutter/widgets.dart' as Base;

class Container extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
    // TODO: implement build
    Base.Widget child =
        WidgetUtil.parseChild(data['child'], buildContext, listener);
    return Base.LayoutBuilder(
      builder: (Base.BuildContext context, Base.BoxConstraints constraints) {
        return Base.Container(
          key: WidgetUtil.parseKey(data['key']),
          child: child,
          color: WidgetUtil.parseColor(data['color']),
          alignment: WidgetUtil.parseAlignment(data['alignment']),
          padding: WidgetUtil.parseEdgeInsetsGeometry(data['padding']),
          margin: WidgetUtil.parseEdgeInsetsGeometry(data['margin']),
          width: WidgetUtil.parseWidth(data['width']),
          height: WidgetUtil.parseHeight(data['height']),
          constraints: WidgetUtil.parseBoxConstraints(data['constraints']),
        );
      },
    );
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'Container';
}

class Flex extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
    // TODO: implement build
    return Base.Flex(
      verticalDirection: WidgetUtil.parseVerticalDirection(
          data['verticalDirection'], Base.VerticalDirection.down),
      direction: WidgetUtil.parseAxis(data['direction']),
      textBaseline: WidgetUtil.parseTextBaseline(data['textBaseline']),
      textDirection: WidgetUtil.parseTextDirection(data['textDirection']),
      crossAxisAlignment: WidgetUtil.parseCrossAxisAlignment(
          data['crossAxisAlignment'], Base.CrossAxisAlignment.center),
      mainAxisAlignment: WidgetUtil.parseMainAxisAlignment(
          data['mainAxisAlignment'], Base.MainAxisAlignment.start),
      mainAxisSize: WidgetUtil.parseMainAxisSize(
          data['mainAxisSize'], Base.MainAxisSize.max),
      key: WidgetUtil.parseKey(data['key']),
      children:
          WidgetUtil.parseChildren(data['children'], buildContext, listener),
    );
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'Flex';
}

class Column extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
    // TODO: implement build
    return Base.Column(
      verticalDirection: WidgetUtil.parseVerticalDirection(
          data['verticalDirection'], Base.VerticalDirection.down),
      textBaseline: WidgetUtil.parseTextBaseline(data['textBaseline']),
      textDirection: WidgetUtil.parseTextDirection(data['textDirection']),
      crossAxisAlignment: WidgetUtil.parseCrossAxisAlignment(
          data['crossAxisAlignment'], Base.CrossAxisAlignment.center),
      mainAxisAlignment: WidgetUtil.parseMainAxisAlignment(
          data['mainAxisAlignment'], Base.MainAxisAlignment.start),
      mainAxisSize: WidgetUtil.parseMainAxisSize(
          data['mainAxisSize'], Base.MainAxisSize.max),
      key: WidgetUtil.parseKey(data['key']),
      children:
          WidgetUtil.parseChildren(data['children'], buildContext, listener),
    );
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'Column';
}

class Row extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
    // TODO: implement build
    return Base.Row(
      verticalDirection: WidgetUtil.parseVerticalDirection(
          data['verticalDirection'], Base.VerticalDirection.down),
      textBaseline: WidgetUtil.parseTextBaseline(data['textBaseline']),
      textDirection: WidgetUtil.parseTextDirection(data['textDirection']),
      crossAxisAlignment: WidgetUtil.parseCrossAxisAlignment(
          data['crossAxisAlignment'], Base.CrossAxisAlignment.center),
      mainAxisAlignment: WidgetUtil.parseMainAxisAlignment(
          data['mainAxisAlignment'], Base.MainAxisAlignment.start),
      mainAxisSize: WidgetUtil.parseMainAxisSize(
          data['mainAxisSize'], Base.MainAxisSize.max),
      key: WidgetUtil.parseKey(data['key']),
      children:
          WidgetUtil.parseChildren(data['children'], buildContext, listener),
    );
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'Row';
}

class Expanded extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
    // TODO: implement build

    return Base.Expanded(
      key: data['key'] != null ? Base.Key(data['key']) : null,
      child: WidgetUtil.parseChild(data['child'], buildContext, listener),
      flex: data['flex'],
    );
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'Expanded';
}

class ExpandedSizedBox extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
    // TODO: implement build
    return Base.SizedBox.expand(
        key: WidgetUtil.parseKey(data['key']),
        child: WidgetUtil.parseChild(data['child'], buildContext, listener));
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'ExpanedSizedBox';
}

class SizedBox extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
    // TODO: implement build
    return Base.SizedBox(
        width: WidgetUtil.parseWidth(data['width']),
        height: WidgetUtil.parseHeight(data['height']),
        key: WidgetUtil.parseKey(data['key']),
        child: WidgetUtil.parseChild(data['child'], buildContext, listener));
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'SizedBox';
}

class FittedBox extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
    // TODO: implement build
    return Base.FittedBox(key: WidgetUtil.parseKey(data['key']));
  }

  @override
  // TODO: implement widgetName
  String get widgetName => throw UnimplementedError();
}

class Wrap extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
    // TODO: implement build
    return Base.Wrap(
      key: WidgetUtil.parseKey(data['key']),
      direction: WidgetUtil.parseAxis(data['direction'], Base.Axis.horizontal),
      alignment: WidgetUtil.parseWrapAlignment(
          data['alignment'], Base.WrapAlignment.start),
      runAlignment: WidgetUtil.parseWrapAlignment(
          data['runAlignment'], Base.WrapAlignment.start),
      spacing: WidgetUtil.parseDouble(data['spacing'], 0.0),
      runSpacing: WidgetUtil.parseDouble(data['runSpacing'], 0.0),
      crossAxisAlignment: WidgetUtil.parseWrapCrossAxisAlignment(
          data['crossAxisAlignment'], Base.WrapCrossAlignment.start),
      textDirection: WidgetUtil.parseTextDirection(data['textDirection']),
      verticalDirection: WidgetUtil.parseVerticalDirection(
          data['verticalDirection'], Base.VerticalDirection.down),
      children:
          WidgetUtil.parseChildren(data['children'], buildContext, listener),
    );
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'Wrap';
}

class SafeArea extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
    // TODO: implement build
    return Base.SafeArea(
      child: WidgetUtil.parseChild(data['child'], buildContext, listener),
      minimum: WidgetUtil.parseEdgeInsetsGeometry(data['minimum']),
      left: WidgetUtil.parseBoolean(data['left'], true),
      right: WidgetUtil.parseBoolean(data['right'], true),
      top: WidgetUtil.parseBoolean(data['top'], true),
      bottom: WidgetUtil.parseBoolean(data['bottom'], true),
      maintainBottomViewPadding:
          WidgetUtil.parseBoolean(data['maintainBottomViewPadding'], true),
    );
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'SafeArea';
}

class Padding extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
    // TODO: implement build
    return Base.Padding(
      child: WidgetUtil.parseChild(data['child'], buildContext, listener),
      padding: WidgetUtil.parseEdgeInsetsGeometry(data['padding']),
    );
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'Padding';
}

class Align extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
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
      EventListener listener) {
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
      EventListener listener) {
    // TODO: implement build

    return Base.Stack(
      key: WidgetUtil.parseKey(data['key']),
      alignment: WidgetUtil.parseAlignment(
          data['alignment'], Base.AlignmentDirectional.topStart),
      textDirection: WidgetUtil.parseTextDirection(data['textDirection']),
      fit: WidgetUtil.parseStackFit(data['fit'], Base.StackFit.loose),
      overflow: WidgetUtil.parseOverflow(data['overflow']),
      children:
          WidgetUtil.parseChildren(data['children'], buildContext, listener),
    );
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'Stack';
}

class IndexedStack extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
    // TODO: implement build

    return Base.IndexedStack(
      key: WidgetUtil.parseKey(data['key']),
      index: WidgetUtil.parseDouble(data['index'], 0.0)?.toInt(),
      alignment: WidgetUtil.parseAlignment(
          data['alignment'], Base.AlignmentDirectional.topStart),
      textDirection: WidgetUtil.parseTextDirection(data['textDirection']),
      children:
          WidgetUtil.parseChildren(data['children'], buildContext, listener),
    );
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'IndexedStack';
}

class Positioned extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
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
