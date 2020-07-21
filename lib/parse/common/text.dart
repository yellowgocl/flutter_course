import 'package:course_book/parse/builder.dart';
import 'package:course_book/utils/widget_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' as Base;

class Text extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
    // TODO: implement parse
    data = data ?? {};
    bool selcetable = WidgetUtil.parseBoolean(data['selectable'], false);
    return selcetable
        ? Base.SelectableText(
            data['data'],
            textAlign: WidgetUtil.parseTextAlign(data['textAlign']),
            maxLines: data['maxLines'],
            textDirection: WidgetUtil.parseTextDirection(data['textDirection']),
            style: WidgetUtil.parseTextStyle(data['textStyle']),
            textScaleFactor: WidgetUtil.parseDouble(data['textScaleFactor']),
          )
        : Base.Text(
            data['data'],
            textAlign: WidgetUtil.parseTextAlign(data['textAlign']),
            overflow: WidgetUtil.parseTextOverflow(data['overflow']),
            maxLines: data['maxLines'],
            softWrap: data['softWrap'],
            textDirection: WidgetUtil.parseTextDirection(data['textDirection']),
            style: WidgetUtil.parseTextStyle(data['textStyle']),
            textScaleFactor: WidgetUtil.parseDouble(data['textScaleFactor']),
          );
  }

  @override
  String get widgetName => 'Text';
}

class RichText extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
    data = data ?? {};
    bool selcetable = WidgetUtil.parseBoolean(data['selectable'], false);
    return selcetable
        ? Base.SelectableText.rich(
            _build(data, buildContext, listener),
            textAlign: WidgetUtil.parseTextAlign(data['textAlign']),
            maxLines: data['maxLines'],
            textDirection: WidgetUtil.parseTextDirection(data['textDirection']),
            style: WidgetUtil.parseTextStyle(data['textStyle']),
            textScaleFactor: WidgetUtil.parseDouble(data['textScaleFactor']),
          )
        : Base.Text.rich(
            _build(data, buildContext, listener),
            textAlign: WidgetUtil.parseTextAlign(data['textAlign']),
            overflow: WidgetUtil.parseTextOverflow(data['overflow']),
            maxLines: data['maxLines'],
            softWrap: data['softWrap'],
            textDirection: WidgetUtil.parseTextDirection(data['textDirection']),
            style: WidgetUtil.parseTextStyle(data['textStyle']),
            textScaleFactor: WidgetUtil.parseDouble(data['textScaleFactor']),
          );
  }

  Base.TextSpan _build(Map<String, dynamic> data,
      Base.BuildContext buildContext, EventListener listener) {
    data = data ?? {};
    return Base.TextSpan(
        text: data['text'],
        style: WidgetUtil.parseTextStyle(data['textStyle']),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            listener.onClicked(data['onClick']);
          },
        children: data['children']
            ?.map((e) => _build(e, buildContext, listener))
            ?.toList());
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'RichText';
}
