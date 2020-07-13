import 'package:logger/logger.dart';

class Log {
  static const DEFAULT_TAG = '__GLOG__';
  static bool debug = true;
  static String tag = DEFAULT_TAG;
  static Logger _logger = Logger();

  static void init({bool debug = true, String tag = DEFAULT_TAG}) {
    Log.debug = debug;
    Log.tag = tag;
  }

  static void e(Object value, {String tag}) {
    // _print(tag, '  e  ', value);
    _logger.e(value);
  }

  static void v(Object value, {String tag}) {
    if (Log.debug) {
      // _print(tag, ' v ', value);
      _logger.v(value);
    }
  }

  static void i(Object value, {String tag}) {
    if (Log.debug) {
      // _print(tag, ' v ', value);
      _logger.i(value);
    }
  }

  static void w(Object value, {String tag}) {
    _logger.w(value);
  }

  static void _print(String tag, String stag, Object value) {
    StringBuffer sb = StringBuffer();
    sb
      ..write('[')
      ..write((tag == null || tag.isEmpty) ? Log.tag : tag)
      ..write(stag)
      ..write(']')
      ..write(value);
    print(sb.toString());
  }
}
