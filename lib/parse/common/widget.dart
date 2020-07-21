import 'dart:io';

import 'package:course_book/parse/builder.dart';
import 'package:course_book/utils/icons_helper.dart';
import 'package:course_book/utils/util.dart';
import 'package:course_book/utils/widget_util.dart';
import 'package:flutter/material.dart' as Base;

class Opacity extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
    // TODO: implement build
    return Base.Opacity(
      opacity: WidgetUtil.parseDouble(data['opacity'], 1.0),
      alwaysIncludeSemantics:
          WidgetUtil.parseBoolean(data['alwaysIncludeSemantics'], false),
      child: WidgetUtil.parseChild(data['child'], buildContext, listener),
      key: WidgetUtil.parseKey(data['key']),
    );
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'Opacity';
}

class Icon extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
    // TODO: implement build
    return Base.Icon(
      data.containsKey('data')
          ? getIconUsingPrefix(name: data['data'])
          : Base.Icons.android,
      size: WidgetUtil.parseDouble(data['size']),
      color: WidgetUtil.parseColor(data['color']),
      semanticLabel: data['semanticLabel'],
      textDirection: WidgetUtil.parseTextDirection(data['textDirection']),
    );
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'Icon';
}

class Image extends JsonWidget {
  Base.Image parseFile(Map<String, dynamic> data) {
    return Base.Image.file(
      File(CollectionUtil.getValue(data, 'file')),
      key: WidgetUtil.parseKey(data['key']),
      semanticLabel: CollectionUtil.getValue(data, 'semanticLabelc'),
      excludeFromSemantics:
          WidgetUtil.parseBoolean(data['excludeFromSemantics'], false),
      scale: WidgetUtil.parseDouble(data['scale']),
      width: WidgetUtil.parseWidth(data['width']),
      height: WidgetUtil.parseWidth(data['height']),
      color: WidgetUtil.parseColor(data['color']),
      colorBlendMode: WidgetUtil.parseBlendMode(data['colorBlendMode']),
      fit: WidgetUtil.parseBoxFit(data['fit']),
      alignment: WidgetUtil.parseAlignment(data['alignment']),
      repeat: WidgetUtil.parseImageRepeat(data['repeat']),
      centerSlice: WidgetUtil.parseRect(data['centerSlice']),
      matchTextDirection: WidgetUtil.parseBoolean(data['matchTextDirection']),
      gaplessPlayback: WidgetUtil.parseBoolean(data['gaplessPlayback']),
      filterQuality: WidgetUtil.parseFilterQuality(data['filterQuality']),
    );
  }

  Base.Image parseNetwork(Map<String, dynamic> data) {
    return Base.Image.network(
      CollectionUtil.getValue(data, 'src'),
      key: WidgetUtil.parseKey(data['key']),
      semanticLabel: CollectionUtil.getValue(data, 'semanticLabelc'),
      excludeFromSemantics:
          WidgetUtil.parseBoolean(data['excludeFromSemantics'], false),
      scale: WidgetUtil.parseDouble(data['scale']),
      width: WidgetUtil.parseWidth(data['width']),
      height: WidgetUtil.parseWidth(data['height']),
      color: WidgetUtil.parseColor(data['color']),
      colorBlendMode: WidgetUtil.parseBlendMode(data['colorBlendMode']),
      fit: WidgetUtil.parseBoxFit(data['fit']),
      alignment: WidgetUtil.parseAlignment(data['alignment']),
      repeat: WidgetUtil.parseImageRepeat(data['repeat']),
      centerSlice: WidgetUtil.parseRect(data['centerSlice']),
      matchTextDirection: WidgetUtil.parseBoolean(data['matchTextDirection']),
      gaplessPlayback: WidgetUtil.parseBoolean(data['gaplessPlayback']),
      filterQuality: WidgetUtil.parseFilterQuality(data['filterQuality']),
    );
  }

  Base.Image parseAssets(Map<String, dynamic> data) {
    return Base.Image.asset(
      CollectionUtil.getValue(data, 'name'),
      key: WidgetUtil.parseKey(data['key']),
      semanticLabel: CollectionUtil.getValue(data, 'semanticLabelc'),
      excludeFromSemantics:
          WidgetUtil.parseBoolean(data['excludeFromSemantics'], false),
      scale: WidgetUtil.parseDouble(data['scale']),
      width: WidgetUtil.parseWidth(data['width']),
      height: WidgetUtil.parseWidth(data['height']),
      color: WidgetUtil.parseColor(data['color']),
      colorBlendMode: WidgetUtil.parseBlendMode(data['colorBlendMode']),
      fit: WidgetUtil.parseBoxFit(data['fit']),
      alignment: WidgetUtil.parseAlignment(data['alignment']),
      repeat: WidgetUtil.parseImageRepeat(data['repeat']),
      centerSlice: WidgetUtil.parseRect(data['centerSlice']),
      matchTextDirection: WidgetUtil.parseBoolean(data['matchTextDirection']),
      gaplessPlayback: WidgetUtil.parseBoolean(data['gaplessPlayback']),
      filterQuality: WidgetUtil.parseFilterQuality(data['filterQuality']),
    );
  }

  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
    // TODO: implement build
    String clickEvent = CollectionUtil.getValue(data, 'onClick');
    Base.Widget result;

    if (data.containsKey('name')) {
      result = parseAssets(data);
    } else if (data.containsKey('src')) {
      result = parseNetwork(data);
    } else if (data.containsKey('file')) {
      result = parseFile(data);
    } else {
      throw ArgumentError.value(
          'data must contain part of [name, src, file] with key.');
    }
    if (listener != null && (clickEvent != null && clickEvent.isNotEmpty)) {
      result = Base.GestureDetector(
        child: result,
        onTap: () {
          listener.onClicked(clickEvent);
        },
      );

      return result;
    }
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'Image';
}

class AspectRatio extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
    // TODO: implement build
    return Base.AspectRatio(
      key: WidgetUtil.parseKey(data['key']),
      aspectRatio: WidgetUtil.parseDouble(data['aspectRatio'], 16.0 / 9.0),
      child: WidgetUtil.parseChild(data['child'], buildContext, listener),
    );
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'AspectRatio';
}

class Baseline extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
    // TODO: implement build
    return Base.Baseline(
      key: WidgetUtil.parseKey(data['key']),
      baselineType: WidgetUtil.parseTextBaseline(data['baselineType']),
      baseline: WidgetUtil.parseDouble(data['baseline']),
      child: WidgetUtil.parseChild(data['child'], buildContext, listener),
    );
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'Baseline';
}

class RaisedButton extends JsonWidget {
  @override
  Base.Widget build(Map<String, dynamic> data, Base.BuildContext buildContext,
      EventListener listener) {
    // TODO: implement build
    return Base.RaisedButton(
      color: WidgetUtil.parseColor(data['color']),
      disabledColor: WidgetUtil.parseColor(data['disabledColor']),
      disabledElevation: WidgetUtil.parseDouble(data['disabledElevation']),
      disabledTextColor: WidgetUtil.parseColor(data['disabledTextColor']),
      elevation: WidgetUtil.parseDouble(data['elevation']),
      padding: WidgetUtil.parseEdgeInsetsGeometry(data['padding']),
      splashColor: WidgetUtil.parseColor(data['splashColor']),
      textColor: WidgetUtil.parseColor(data['textColor']),
      child: WidgetUtil.parseChild(data['child'], buildContext, listener),
      onPressed: () {
        listener?.onClicked(CollectionUtil.getValue(data, 'onClick', ''));
      },
    );
  }

  @override
  // TODO: implement widgetName
  String get widgetName => 'RaisedButton';
}
