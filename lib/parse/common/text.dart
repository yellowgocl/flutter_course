import 'package:course_book/model/widget/textWidgetData.dart';
import 'package:course_book/parse/builder.dart';
import 'package:course_book/utils/widgetUtil.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart' as Base;

class Text extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      ClickListener listener) {
    // TODO: implement parse
    data = data ?? {};
    return Base.Text(
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
      ClickListener listener) {
    data = data ?? {};
    return Base.Text.rich(
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
      Base.BuildContext buildContext, ClickListener listener) {
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
