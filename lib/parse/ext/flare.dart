import 'package:course_book/parse/builder.dart';
import 'package:course_book/utils/util.dart';
import 'package:course_book/utils/widget_util.dart';
import 'package:flare_flutter/flare_actor.dart' as Flare;
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';

class FlareActor extends JsonWidget {
  @override
  Widget build(Map<String, dynamic> data, BuildContext buildContext,
      EventListener listener) {
    return Flare.FlareActor(
      CollectionUtil.getValue(data, 'src'),
      boundsNode: CollectionUtil.getValue(data, 'boundsNode'),
      color: WidgetUtil.parseColor(data['color']),
      fit: WidgetUtil.parseBoxFit(data['fit']),
      isPaused: WidgetUtil.parseBoolean(data['isPaused'], false),
      snapToEnd: WidgetUtil.parseBoolean(data['snapToEnd'], false),
      artboard: CollectionUtil.getValue(data, 'artboard'),
      sizeFromArtboard:
          WidgetUtil.parseBoolean(data['sizeFromArtboard'], false),
      shouldClip: WidgetUtil.parseBoolean(data['shouldClip'], true),
      alignment: WidgetUtil.parseAlignment(data['alignment']),
      animation: CollectionUtil.getValue(data, 'animation'),
      callback: (String animation) {
        listener?.onCompleted(animation);
      },
      controller: FlareControls(),
    );
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'FlareActor';
}
