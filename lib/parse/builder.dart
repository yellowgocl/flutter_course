import 'package:flutter/widgets.dart';

abstract class WidgetParser<T> {
  Widget parse(T data, BuildContext buildContext, ClickListener listener);
  String get widgetName;
}

abstract class ClickListener {
  void onClicked(String event);
}
