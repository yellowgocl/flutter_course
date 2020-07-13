import 'package:course_book/parse/builder.dart';
import 'package:course_book/utils/log.dart';
import 'package:course_book/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  static TextDirection parseTextDirection(dynamic value) {
    TextDirection result = TextDirection.ltr;
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

  static Color parseColor(dynamic value) {
    Color result = Colors.black;
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

  static BoxFit parseBoxFit(dynamic value) {
    if (value == null || value < 0) {
      return null;
    }
    if (value == 0 || value == 'fill') {
      return BoxFit.fill;
    } else if (value == 1 || value == 'contain') {
      return BoxFit.contain;
    } else if (value == 2 || value == 'cover') {
      return BoxFit.cover;
    } else if (value == 3 || value == 'fitWidth') {
      return BoxFit.fitWidth;
    } else if (value == 4 || value == 'fitHeight') {
      return BoxFit.fitHeight;
    } else if (value == 5 || value == 'none') {
      return BoxFit.none;
    } else if (value == 6 || value == 'scaleDown') {
      return BoxFit.scaleDown;
    }
    return null;
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
    if (value == 'match_parent' || value == 'matchParent') {
      value = parseDouble(ScreenUtil.screenWidth);
    } else if (value == 'wrap_content' || value == 'wrapContent') {
      value = parseDouble(double.maxFinite);
    }
    return parseDouble(value);
  }

  static double parseHeight(value, [double defaultValue]) {
    if (value == 'match_parent' || value == 'matchParent') {
      value = parseDouble(ScreenUtil.screenHeight);
    } else if (value == 'wrap_content' || value == 'wrapContent') {
      value = parseDouble(double.maxFinite);
    }
    return parseDouble(value);
  }

  static double parseDouble(value, [double defualtValue]) {
    double result = defualtValue != null ? defualtValue : null;
    if (value is int) {
      value = value.toDouble();
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

  static EdgeInsetsGeometry parseEdgeInsetsGeometry(dynamic value,
      [EdgeInsetsGeometry defaultValue]) {
    EdgeInsetsGeometry result = defaultValue;
    if (value is String) {
      if (value.contains(',')) {
        value = value.split(',');
      } else if (value.contains(';')) {
        value = value.split(';');
      } else {
        value = parseDouble(value);
      }
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
      result = EdgeInsets.only(
        left: parseDouble(value['left']),
        right: parseDouble(value['right']),
        top: parseDouble(value['top']),
        bottom: parseDouble(value['bottom']),
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
      [ClickListener listener]) {
    return child != null
        ? BaseWidgetBuilder.buildFromMap(child, buildContext, listener)
        : null;
  }

  static List<Widget> parseChildren(
      List<Map<String, dynamic>> children, BuildContext buildContext,
      [ClickListener listener]) {
    if (children == null || children.isEmpty) {
      return null;
    }
    return children
        .map<Widget>((Map<String, dynamic> child) =>
            parseChild(child, buildContext, listener))
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
}
