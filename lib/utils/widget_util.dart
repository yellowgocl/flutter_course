import 'package:course_book/parse/builder.dart';
import 'package:course_book/utils/log.dart';
import 'package:course_book/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as Intl;

class WidgetUtil {
  /// parseTextAlign(String|int value)
  ///
  /// params
  /// * left: 0|left
  /// * right: 1|right
  /// * center: 2|center
  /// * justify: 3|justify
  /// * start: 4|start
  /// * end: 5|end
  ///
  /// return type of TextAlign
  ///
  static TextAlign parseTextAlign(dynamic value) {
    TextAlign result = TextAlign.start;
    if (value == 0 || value == 'left') {
      result = TextAlign.left;
    } else if (value == 1 || value == 'right') {
      result = TextAlign.right;
    } else if (value == 2 || value == 'center') {
      result = TextAlign.center;
    } else if (value == 3 || value == 'justify') {
      result = TextAlign.justify;
    } else if (value == 4 || value == 'start') {
      result = TextAlign.start;
    } else if (value == 5 || value == 'end') {
      result = TextAlign.end;
    }
    return result;
  }

  static TextOverflow parseTextOverflow(dynamic textOverflow) {
    TextOverflow result = TextOverflow.ellipsis;
    if (textOverflow == 0 || textOverflow == 'clip') {
      result = TextOverflow.clip;
    } else if (textOverflow == 1 || textOverflow == 'fade') {
      result = TextOverflow.fade;
    } else if (textOverflow == 2 || textOverflow == 'ellipsis') {
      result = TextOverflow.ellipsis;
    } else if (textOverflow == 2 || textOverflow == 'visible') {
      result = TextOverflow.visible;
    }
    return result;
  }

  static TextDecoration parseTextDecoration(String textDecoration) {
    TextDecoration result = TextDecoration.none;
    switch (textDecoration) {
      case 'lineThrough':
        result = TextDecoration.lineThrough;
        break;
      case 'overline':
        result = TextDecoration.overline;
        break;
      case 'underline':
        result = TextDecoration.underline;
        break;
    }
  }

  static String composeTextDecoration(TextDecoration textDecoration) {
    String result = 'none';
    if (textDecoration == TextDecoration.lineThrough) {
      result = 'lineThrough';
    } else if (textDecoration == TextDecoration.overline) {
      result = 'overline';
    } else if (textDecoration == TextDecoration.underline) {
      result = 'underline';
    }
    return result;
  }

  static TextDirection parseTextDirection(dynamic value,
      [TextDirection defaultValue]) {
    TextDirection result = defaultValue;
    if (value == 0 || value == 'rtl') {
      result = TextDirection.rtl;
    }
    return result;
  }

  static FontWeight parseFontWeight(String fontWeight) {
    FontWeight result = FontWeight.normal;
    switch (fontWeight) {
      case 'w100':
        result = FontWeight.w100;
        break;
      case 'w200':
        result = FontWeight.w200;
        break;
      case 'w300':
        result = FontWeight.w300;
        break;
      case 'w400':
        result = FontWeight.w400;
        break;
      case 'w500':
        result = FontWeight.w500;
        break;
      case 'w600':
        result = FontWeight.w600;
        break;
      case 'w700':
        result = FontWeight.w700;
        break;
      case 'w800':
        result = FontWeight.w800;
        break;
      case 'w900':
        result = FontWeight.w900;
        break;
      case 'bold':
        result = FontWeight.bold;
        break;
    }
    return result;
  }

  static Color parseColor(dynamic value, [Color defaultValue]) {
    Color result = defaultValue;
    if (value is String) {
      result = Color(parseHex(value));
    }
    return result;
  }

  static String composeColor(Color color) {
    return color != null ? '#${color.value.toRadixString(16)}' : null;
  }

  static BoxConstraints parseBoxConstraints([Map<String, dynamic> value]) {
    return BoxConstraints(
        maxHeight: parseDouble(
            CollectionUtil.getValue(value, 'maxHeight'), double.infinity),
        maxWidth: parseDouble(
            CollectionUtil.getValue(value, 'maxWidth'), double.infinity),
        minWidth: parseDouble(CollectionUtil.getValue(value, 'minWidth'), 0.0),
        minHeight:
            parseDouble(CollectionUtil.getValue(value, 'minHeight'), 0.0));
  }

  static Map<String, double> composeBoxContraints(BoxConstraints value) {
    return {
      "minWidth": value?.minWidth,
      "minHeight": value?.minHeight,
      "maxWidth": value?.maxWidth,
      "maxHeight": value?.maxHeight
    };
  }

  static TextBaseline parseTextBaseline(dynamic textBaseline) {
    TextBaseline result = TextBaseline.alphabetic;
    if (textBaseline == 'alphabetic' || textBaseline == 0) {
      result = TextBaseline.alphabetic;
    } else if (textBaseline == 'ideographic' || textBaseline == 1) {
      result = TextBaseline.ideographic;
    }
    return result;
  }

  static VerticalDirection parseVerticalDirection(dynamic value,
      [VerticalDirection defaultValue]) {
    VerticalDirection result = defaultValue;
    if (value == 0 || value == 'up') {
    } else if (value == 1 || value == 'down') {
      result = VerticalDirection.down;
    }
    return result;
  }

  static BlendMode parseBlendMode(value) {
    if (value == null || value.trim().length == 0) {
      return null;
    }
    BlendMode result;
    if (value == 0 || value == 'clear') {
      result = BlendMode.clear;
    } else if (value == 1 || value == 'src') {
      result = BlendMode.src;
    } else if (value == 2 || value == 'dst') {
      result = BlendMode.dst;
    } else if (value == 3 || value == 'srcOver') {
      result = BlendMode.srcOver;
    } else if (value == 4 || value == 'dstOver') {
      result = BlendMode.dstOver;
    } else if (value == 5 || value == 'srcIn') {
      result = BlendMode.srcIn;
    } else if (value == 6 || value == 'dstIn') {
      result = BlendMode.dstIn;
    } else if (value == 7 || value == 'srcOut') {
      result = BlendMode.srcOut;
    } else if (value == 8 || value == 'dstOut') {
      result = BlendMode.dstOut;
    } else if (value == 9 || value == 'srcATop') {
      result = BlendMode.srcATop;
    } else if (value == 10 || value == 'dstATop') {
      result = BlendMode.dstATop;
    } else if (value == 11 || value == 'xor') {
      result = BlendMode.xor;
    } else if (value == 12 || value == 'plus') {
      result = BlendMode.plus;
    } else if (value == 13 || value == 'modulate') {
      result = BlendMode.modulate;
    } else if (value == 14 || value == 'screen') {
      result = BlendMode.screen;
    } else if (value == 15 || value == 'overlay') {
      result = BlendMode.overlay;
    } else if (value == 16 || value == 'darken') {
      result = BlendMode.darken;
    } else if (value == 17 || value == 'lighten') {
      result = BlendMode.lighten;
    } else if (value == 18 || value == 'colorDodge') {
      result = BlendMode.colorDodge;
    } else if (value == 19 || value == 'colorBurn') {
      result = BlendMode.colorBurn;
    } else if (value == 20 || value == 'hardLight') {
      result = BlendMode.hardLight;
    } else if (value == 21 || value == 'softLight') {
      result = BlendMode.softLight;
    } else if (value == 22 || value == 'difference') {
      result = BlendMode.difference;
    } else if (value == 23 || value == 'exclusion') {
      result = BlendMode.exclusion;
    } else if (value == 24 || value == 'multiply') {
      result = BlendMode.multiply;
    } else if (value == 25 || value == 'hue') {
      result = BlendMode.hue;
    } else if (value == 26 || value == 'saturation') {
      result = BlendMode.saturation;
    } else if (value == 27 || value == 'color') {
      result = BlendMode.color;
    } else if (value == 28 || value == 'luminosity') {
      result = BlendMode.luminosity;
    } else {
      result = BlendMode.srcIn;
    }
    return result;
  }

  static BoxFit parseBoxFit(dynamic value, [BoxFit defaultValue]) {
    BoxFit result = defaultValue;
    if (value == 0 || value == 'fill') {
      result = BoxFit.fill;
    } else if (value == 1 || value == 'contain') {
      result = BoxFit.contain;
    } else if (value == 2 || value == 'cover') {
      result = BoxFit.cover;
    } else if (value == 3 || value == 'fitWidth') {
      result = BoxFit.fitWidth;
    } else if (value == 4 || value == 'fitHeight') {
      result = BoxFit.fitHeight;
    } else if (value == 5 || value == 'none') {
      result = BoxFit.none;
    } else if (value == 6 || value == 'scaleDown') {
      result = BoxFit.scaleDown;
    }
    return result;
  }

  static Axis parseAxis(dynamic value, [Axis defaultValue]) {
    Axis result = defaultValue;
    if (value == 0 || value == 'horizontal') {
      result = Axis.horizontal;
    } else if (value == 1 || value == 'vertical') {
      result = Axis.vertical;
    }
    return result;
  }

  static int parseHex(String hexString) {
    hexString = hexString.toUpperCase().replaceAll("#", "");
    if (hexString.length == 6) {
      hexString = "FF" + hexString;
    }
    return int.parse(hexString, radix: 16);
  }

  static Map<String, dynamic> composeTextStyle(TextStyle value) {
    if (value == null) {
      return null;
    }
    return {
      "color": composeColor(value?.color),
      "debugLabel": value?.debugLabel,
      "decoration": composeTextDecoration(value?.decoration),
      "fontSize": value?.fontSize,
      "fontFamily": value?.fontFamily,
      "fontStyle": value?.fontStyle == FontStyle.italic ? 'italic' : 'normal',
      "letterSpacing": value?.letterSpacing,
      "textBaseline": value?.textBaseline?.index,
    };
  }

  static TextStyle parseTextStyle(Map<String, dynamic> textStyle) {
    textStyle = textStyle ?? {};
    Color color = parseColor(textStyle['color']);
    String debugLable = textStyle['debugLabel'];
    TextDecoration decoration = parseTextDecoration(textStyle['decoration']);
    double fontSize = parseDouble(textStyle['fontSize']);
    FontWeight fontWeight = parseFontWeight(textStyle['fontWeight']);
    String fontFamily = textStyle['fontFamily'];
    FontStyle fontStyle = 'italic' == textStyle['fontStyle']
        ? FontStyle.italic
        : FontStyle.normal;
    double letterSpacing = parseDouble(textStyle['letterSpacing']);
    TextBaseline textBaseline = parseTextBaseline(textStyle['textBaseline']);
    return TextStyle(
      color: color,
      debugLabel: debugLable,
      decoration: decoration,
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      textBaseline: textBaseline,
    );
  }

  ///
  /// 约束布局内的位置约束定义
  /// ```
  ///  | 8  |  1  |  2 |
  ///  | 7  |  9  |  3 |
  ///  | 6  |  5  |  4 |
  /// ```
  ///
  static AlignmentGeometry parseAlignment(alignment,
      [AlignmentGeometry defaultValue]) {
    AlignmentGeometry result = defaultValue;
    if (alignment == 1 || alignment == 'topCenter') {
      result = Alignment.topCenter;
    } else if (alignment == 2 || alignment == 'topRight') {
      result = Alignment.topRight;
    } else if (alignment == 3 || alignment == 'centerRight') {
      result = Alignment.centerRight;
    } else if (alignment == 4 || alignment == 'bottomRight') {
      result = Alignment.bottomRight;
    } else if (alignment == 5 || alignment == 'bottomCenter') {
      result = Alignment.bottomCenter;
    } else if (alignment == 6 || alignment == 'bottomLeft') {
      result = Alignment.bottomLeft;
    } else if (alignment == 7 || alignment == 'centerLeft') {
      result = Alignment.centerLeft;
    } else if (alignment == 8 || alignment == 'topLeft') {
      result = Alignment.topLeft;
    } else if (alignment == 9 || alignment == 'center') {
      result = Alignment.center;
    } else {
      if (alignment is List && alignment.isNotEmpty) {
        double x = 0.0;
        double y = 0.0;
        if (alignment.length == 1) {
          x = y = parseDouble(alignment[0]);
        } else if (alignment.length >= 2) {
          alignment = alignment.sublist(0, 2);
          x = parseDouble(alignment[0]);
          y = parseDouble(alignment[1]);
        }
        result = Alignment(x, y);
      } else if (alignment is Map) {
        result = Alignment(
            parseDouble(CollectionUtil.getValue(alignment, 'x', 0.0)),
            parseDouble(CollectionUtil.getValue(alignment, 'y', 0.0)));
      }
    }
    return result;
  }

  static CrossAxisAlignment parseCrossAxisAlignment(dynamic value,
      [CrossAxisAlignment defaultValue]) {
    CrossAxisAlignment result = defaultValue;
    if (value == 0 || value == 'start') {
      result = CrossAxisAlignment.start;
    } else if (value == 1 || value == 'end') {
      result = CrossAxisAlignment.end;
    } else if (value == 2 || value == 'center') {
      result = CrossAxisAlignment.center;
    } else if (value == 3 || value == 'stretch') {
      result = CrossAxisAlignment.stretch;
    } else if (value == 4 || value == 'baseline') {
      result = CrossAxisAlignment.baseline;
    }
    return result;
  }

  static MainAxisAlignment parseMainAxisAlignment(dynamic value,
      [MainAxisAlignment defaultValue]) {
    MainAxisAlignment result = defaultValue;
    if (value == 0 || value == 'start') {
      result = MainAxisAlignment.start;
    } else if (value == 1 || value == 'end') {
      result = MainAxisAlignment.end;
    } else if (value == 2 || value == 'center') {
      result = MainAxisAlignment.center;
    } else if (value == 3 || value == 'spaceBetween') {
      result = MainAxisAlignment.spaceBetween;
    } else if (value == 4 || value == 'spaceAround') {
      result = MainAxisAlignment.spaceAround;
    } else if (value == 5 || value == 'spaceEvenly') {
      result = MainAxisAlignment.spaceEvenly;
    }
    return result;
  }

  static MainAxisSize parseMainAxisSize(dynamic value,
      [MainAxisSize defaultValue]) {
    MainAxisSize result = defaultValue;
    if (value == 0 || value == 'min') {
      result = MainAxisSize.min;
    } else if (value == 1 || value == 'max') {
      result = MainAxisSize.max;
    }
    return result;
  }

  static Overflow parseOverflow(dynamic value, [Overflow defaultValue]) {
    Overflow result = defaultValue;
    if (value == 0 || value == 'visible') {
      result = Overflow.visible;
    } else if (value == 1 || value == 'clip') {
      result = Overflow.clip;
    }
    return result;
  }

  static Key parseKey(String value, [Key defaultValue]) {
    Key result = defaultValue;
    if (value != null && value.trim().length > 0) {
      result = Key(value);
    }
    return result;
  }

  static StackFit parseStackFit(dynamic value, [StackFit defaultValue]) {
    StackFit result = defaultValue;
    if (value == 0 || value == 'loose') {
      result = StackFit.loose;
    } else if (value == 1 || value == 'expand') {
      result = StackFit.expand;
    } else if (value == 2 || value == 'passthrough') {
      result = StackFit.passthrough;
    }
    return result;
  }

  static double parseWidth(value, [double defaultValue]) {
    if (value is String) {
      String v = value;
      if (value == 'match_parent' || value == 'matchParent') {
        value = parseDouble(ScreenUtil.screenWidth);
      } else if (value == 'wrap_content' || value == 'wrapContent') {
        value = parseDouble(double.maxFinite);
      } else if (value.endsWith('dp')) {
        value = ScreenUtil()
            .setWidth(parseDouble(value.replaceAll('dp', ''), defaultValue));
      }
    }
    return parseDouble(value, defaultValue);
  }

  static double parseHeight(value, [double defaultValue]) {
    if (value is String) {
      if (value == 'match_parent' || value == 'matchParent') {
        value = parseDouble(ScreenUtil.screenHeight);
      } else if (value == 'wrap_content' || value == 'wrapContent') {
        value = parseDouble(double.maxFinite);
      } else if (value.endsWith('dp')) {
        value = ScreenUtil()
            .setWidth(parseDouble(value.replaceAll('dp', ''), defaultValue));
      }
    }
    double result = parseDouble(value, defaultValue);
    return result;
  }

  static double parseDouble(dynamic value, [double defualtValue]) {
    double result = defualtValue != null ? defualtValue : null;
    if (value is int) {
      value = value.toDouble();
    } else if (value is String) {
      try {
        value = Intl.NumberFormat().parse(value);
      } on FormatException catch (err) {
        Log.e(err?.message);
        value = defualtValue;
      }
    }

    if (value != null) {
      result = value >= double.maxFinite ? double.maxFinite : value;
    }
    return result;
  }

  static bool parseBoolean(value, [bool defaultValue]) {
    bool result = defaultValue;
    if (value is bool && value != null) {
      result = value;
    } else {
      if (value == 0 || value == 'false') {
        result = false;
      } else if (value == 1 || value == 'true') {
        result = true;
      }
    }
    return result;
  }

  static List<String> parseListByString<T>(String value,
      [List<String> defaultValue]) {
    List<String> result = defaultValue;
    if (value is String) {
      if (value.contains(',')) {
        result = value.split(',');
      } else if (value.contains(';')) {
        result = value.split(';');
      }
    }
    return result;
  }

  static EdgeInsetsGeometry parseEdgeInsetsGeometry(dynamic value,
      [EdgeInsetsGeometry defaultValue]) {
    EdgeInsetsGeometry result = defaultValue;
    if (value is String) {
      value = parseListByString(value) ?? parseDouble(value);
    }
    if (value is List) {
      if (value.isNotEmpty) {
        if (value.length == 2) {
          value = Map.from({
            'left': parseDouble(value[1]),
            'right': parseDouble(value[1]),
            'bottom': parseDouble(value[0]),
            'top': parseDouble(value[0]),
          });
        } else if (value.length == 4) {
          value = Map.from({
            'left': parseDouble(value[0]),
            'right': parseDouble(value[2]),
            'bottom': parseDouble(value[3]),
            'top': parseDouble(value[1]),
          });
        } else if (value.length == 3) {
          value = Map.from({
            'left': parseDouble(value[1]),
            'right': parseDouble(value[1]),
            'bottom': parseDouble(value[2]),
            'top': parseDouble(value[0]),
          });
        }
      }
    }
    if (value == 0 || value == 'zero') {
      result = EdgeInsets.zero;
    } else if (value is Map) {
      if (value.containsKey('x') || value.containsKey('y')) {
        value['right'] = value['left'] = parseDouble(value['x']);
        value['top'] = value['bottom'] = parseDouble(value['y']);
      }
      result = EdgeInsets.only(
        left: parseDouble(value['left'], 0.0),
        right: parseDouble(value['right'], 0.0),
        top: parseDouble(value['top'], 0.0),
        bottom: parseDouble(value['bottom'], 0.0),
      );
    } else if (value is double) {
      result = EdgeInsets.all(value);
    }
    return result;
  }

  static Map<String, dynamic> composeEdgeInsetsGeometry(
      EdgeInsetsGeometry value) {
    Map<String, dynamic> result;
    if (value is EdgeInsets) {
      result = {
        "left": value?.left,
        "right": value?.right,
        "top": value?.top,
        "bootom": value?.bottom
      };
    } else {
      result = {
        "left": value?.horizontal,
        "right": value?.horizontal,
        "top": value?.vertical,
        "bottom": value?.vertical,
      };
    }
    return result;
  }

  static Widget parseChild(
      Map<String, dynamic> child, BuildContext buildContext,
      [EventListener listener,
      Widget Function(Map<String, dynamic> child, BuildContext buildContext,
              [EventListener listener])
          combine]) {
    return child != null
        ? combine != null
            ? combine(child, buildContext, listener)
            : BaseWidgetBuilder.buildFromMap(child, buildContext, listener)
        : null;
  }

  static List<Widget> parseChildren(
      List<dynamic> children, BuildContext buildContext,
      [EventListener listener]) {
    if (children == null || children.isEmpty) {
      return null;
    }
    return children
        .map<Widget>((child) => parseChild(child, buildContext, listener))
        .toList();
  }

  static WrapAlignment parseWrapAlignment(dynamic value,
      [WrapAlignment defaultValue]) {
    WrapAlignment result = defaultValue;
    if (value == 0 || value == 'start') {
      result = WrapAlignment.start;
    } else if (value == 1 || value == 'end') {
      result = WrapAlignment.end;
    } else if (value == 2 || value == 'center') {
      result = WrapAlignment.center;
    } else if (value == 3 || value == 'spaceBetween') {
      result = WrapAlignment.spaceBetween;
    } else if (value == 4 || value == 'spaceAround') {
      result = WrapAlignment.spaceAround;
    } else if (value == 5 || value == 'spaceEvenly') {
      result = WrapAlignment.spaceEvenly;
    }
    return result;
  }

  static WrapCrossAlignment parseWrapCrossAxisAlignment(dynamic value,
      [WrapCrossAlignment defaultValue]) {
    WrapCrossAlignment result = defaultValue;
    if (value == 0 || value == 'start') {
      result = WrapCrossAlignment.start;
    } else if (value == 1 || value == 'end') {
      result = WrapCrossAlignment.end;
    } else if (value == 2 || value == 'center') {
      result = WrapCrossAlignment.center;
    }
    return result;
  }

  static ImageRepeat parseImageRepeat(dynamic value,
      [ImageRepeat defaultValue]) {
    ImageRepeat result = defaultValue;
    if (value == 0 || value == 'repeat') {
      result = ImageRepeat.repeat;
    } else if (value == 1 || value == 'repeatX') {
      result = ImageRepeat.repeatX;
    } else if (value == 2 || value == 'repeatY') {
      result = ImageRepeat.repeatY;
    } else if (value == 3 || value == 'noRepeat') {
      result = ImageRepeat.noRepeat;
    }
    return result;
  }

  static Rect parseRect(dynamic value, [Rect defaultValue]) {
    Rect result = defaultValue;
    value = parseListByString(value) ?? parseDouble(value);
    if (value is double) {
      result = Rect.fromLTRB(value, value, value, value);
    } else if (value is List && value.isNotEmpty) {
      if (value.length >= 4) {
        result = Rect.fromLTRB(parseDouble(value[0]), parseDouble(value[1]),
            parseDouble(value[2]), parseDouble(value[3]));
      } else if (value.length == 3) {
        result = Rect.fromLTRB(parseDouble(value[0]), parseDouble(value[1]),
            parseDouble(value[0]), parseDouble(value[2]));
      } else if (value.length == 2) {
        result = Rect.fromLTRB(parseDouble(value[0]), parseDouble(value[1]),
            parseDouble(value[0]), parseDouble(value[1]));
      }
    } else if (value is Map && value.isNotEmpty) {
      if (value.containsKey('left') ||
          value.containsKey('right') ||
          value.containsKey('top') ||
          value.containsKey('bottom')) {
        result = Rect.fromLTRB(
            parseDouble(CollectionUtil.getValue(value, 'left'), 0.0),
            parseDouble(CollectionUtil.getValue(value, 'top'), 0.0),
            parseDouble(CollectionUtil.getValue(value, 'right'), 0.0),
            parseDouble(CollectionUtil.getValue(value, 'bottom'), 0.0));
      } else if (value.containsKey('left') ||
          value.containsKey('top') ||
          value.containsKey('width') ||
          value.containsKey('height')) {
        result = Rect.fromLTWH(
            parseDouble(CollectionUtil.getValue(value, 'left'), 0.0),
            parseDouble(CollectionUtil.getValue(value, 'top'), 0.0),
            parseDouble(CollectionUtil.getValue(value, 'width'), 0.0),
            parseDouble(CollectionUtil.getValue(value, 'height'), 0.0));
      } else if (value.containsKey('center')) {
        if (value.containsKey('width') || value.containsKey('height')) {
          double v = parseDouble(CollectionUtil.getValue(value, 'width')) ??
              parseDouble(CollectionUtil.getValue(value, 'height'));
          result = Rect.fromCenter(
              center: parseOffset(value['center'], Offset(0, 0)),
              width: parseDouble(CollectionUtil.getValue(value, 'width'), v),
              height: parseDouble(CollectionUtil.getValue(value, 'height'), v));
        } else if (value.containsKey('radius')) {
          result = Rect.fromCircle(
              center: parseOffset(value['center'], Offset(0, 0)),
              radius: parseDouble(CollectionUtil.getValue(value, 'radius'), 0));
        }
      }
    }
    return result;
  }

  static Offset parseOffset(dynamic value, [Offset defaultValue]) {
    Offset result = defaultValue;
    value = parseListByString(value) ?? parseDouble(value);
    if (value is double) {
      result = Offset(value, value);
    } else if (value is List) {
      double dx = parseDouble(value[0], 0.0);
      double dy = parseDouble(value.length == 1 ? value[0] : value[1], 0.0);
      result = Offset(dx, dy);
    } else if (value is Map) {
      if (value.containsKey('direction')) {
        result = Offset.fromDirection(
            parseDouble(CollectionUtil.getValue(value, 'direction'), 0.0),
            parseDouble(CollectionUtil.getValue(value, 'distance'), 0.0));
      } else if (value.containsKey('dx') || value.containsKey('dy')) {
        result = Offset(parseDouble(CollectionUtil.getValue(value, 'dx'), 0.0),
            parseDouble(CollectionUtil.getValue(value, 'dy'), 0.0));
      }
    }
  }

  static FilterQuality parseFilterQuality(dynamic value,
      [FilterQuality defaultValue]) {
    FilterQuality result = defaultValue;
    if (value == 0 || value == 'none') {
      result = FilterQuality.none;
    } else if (value == 1 || value == 'low') {
      result = FilterQuality.low;
    } else if (value == 2 || value == 'medium') {
      result = FilterQuality.medium;
    } else if (value == 3 || value == 'high') {
      result = FilterQuality.high;
    }
    return result;
  }
}
