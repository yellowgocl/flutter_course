import 'package:connectivity/connectivity.dart';
import 'package:course_book/utils/log.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class HttpError {
  static const int UNAUTHORIZED = 401;
  static const int FOBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int REQUEST_TIMEOUT = 408;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int BAD_GATEWAY = 502;
  static const int SERVICE_UNAVAILABLE = 503;
  static const int GATEWAY_TIMEOUT = 504;

  static const String UNKNOWN = 'UNKNOW';

  static const String PARSE_ERROR = 'PARSE_ERROR';

  static const String NETWORK_ERROR = 'NETWORK_ERROR';

  static const String HTTP_ERROR = 'HTTP_ERROR';

  static const String SSL_ERROR = 'SSL_ERROR';

  static const String CONNECT_TIMEOUT = 'CONNECT_TIMEOUT';

  static const String RECEIVE_TIMEOUT = 'RECEIVE_TIMEOUT';

  static const String SEND_TIMEOUT = 'SEND_TIMEOUT';

  static const String CANCEL = 'CANCEL';

  String code;
  String message;

  HttpError(this.code, this.message);

  HttpError.dioError(DioError error) {
    message = error.message;
    switch (error.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        code = CONNECT_TIMEOUT;
        message = '网络连接超时，稍后重试！';
        break;
      case DioErrorType.SEND_TIMEOUT:
        code = SEND_TIMEOUT;
        message = '网络连接超时，稍后重试！';
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        code = RECEIVE_TIMEOUT;
        message = '服务器异常.';
        break;
      case DioErrorType.RESPONSE:
        code = HTTP_ERROR;
        message = '服务器异常.';
        break;
      case DioErrorType.CANCEL:
        code = CANCEL;
        message = '请求已取消，请重新请求.';
        break;
      case DioErrorType.DEFAULT:
        code = UNKNOWN;
        message = '网络异常，稍后重试.';
        break;
    }
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'HttpError{code: $code, message: $message}';
  }
}

typedef SuccessCallback<T> = void Function(dynamic data);
typedef FailureCallback<T> = void Function(HttpError data);
typedef T JsonParse<T>(dynamic data);

class Request {
  Map<String, CancelToken> _cancelTokens = Map<String, CancelToken>();

  static const int DEFAULT_CONNECT_TIMEOUT = 3000 * 10;
  static const int DEFAULT_RECEIVE_TIMEOUT = 3000 * 10;

  static const String GET = 'get';
  static const String POST = 'post';

  Dio _client;

  static final Request _instance = Request._internal();
  factory Request() => _instance;

  Request._internal() {
    if (_client == null) {
      BaseOptions options = BaseOptions(
          connectTimeout: DEFAULT_CONNECT_TIMEOUT,
          receiveTimeout: DEFAULT_RECEIVE_TIMEOUT);
      _client = Dio(options);
    }
  }
  void init(
      {String baseUrl,
      int connectTimeout,
      int receiveTimeout,
      List<Interceptor> interceptors}) {
    _client.options = _client.options.merge(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );
    if (interceptors != null && interceptors.isNotEmpty) {
      _client.interceptors..addAll(interceptors);
    }
  }

  Future<dynamic> post({
    @required String url,
    data,
    Map<String, dynamic> params,
    Options options,
    SuccessCallback success,
    FailureCallback failure,
    @required String tag,
  }) {
    return _request(
        url: url,
        tag: tag,
        data: data,
        method: POST,
        params: params,
        success: success,
        failure: failure);
  }

  Future<T> get<T>({
    @required String url,
    data,
    Map<String, dynamic> params,
    Options options,
    SuccessCallback success,
    FailureCallback failure,
    JsonParse<T> parse,
    @required String tag,
  }) {
    return _request(
        url: url,
        tag: tag,
        data: data,
        method: GET,
        params: params,
        parse: parse,
        success: success,
        failure: failure);
  }

  Future<T> _request<T>({
    @required String url,
    String method,
    data,
    Map<String, dynamic> params,
    Options options,
    SuccessCallback success,
    FailureCallback failure,
    JsonParse<T> parse,
    @required String tag,
  }) async {
    bool flag = await checkNetwork(failure);
    if (!flag) {
      return Future.error(!flag);
    }
    params = params ?? {};
    method = method ?? 'GET';
    options?.method = method;
    options = options ?? Options(method: method);
    url = _prepareUrl(url, params);
    try {
      CancelToken cancelToken;
      if (tag != null) {
        cancelToken = _cancelTokens[tag] ?? CancelToken();
        _cancelTokens[tag] = cancelToken;
      }
      Response<Map<String, dynamic>> response = await _client
          .request<Map<String, dynamic>>(url,
              data: data,
              queryParameters: params,
              options: options,
              cancelToken: cancelToken)
          .catchError((e) {
        Log.e(e);
      });
      //int statusCode = response.data['statusCode'];
      Map<String, dynamic> responseData = response.data;
      if (responseData['code'] == 200) {
        if (parse != null) {
          return parse(responseData["data"]);
        } else {
          return responseData["data"];
        }
      } else {
        return Future.error(response);
      }
    } on DioError catch (e, s) {
      Log.e(e.request.baseUrl + e.request.path);
      Log.v('请求出错: $e\n$s');
      if (failure != null && e.type != DioErrorType.CANCEL) {
        failure(HttpError.dioError(e));
      }
      return Future.error(e);
    } catch (e, s) {
      Log.e(e.request.baseUrl + e.request.path);
      Log.v('请求出错: $e\n$s');
      if (failure != null) {
        failure(HttpError(HttpError.UNKNOWN, "网络异常，请稍后重试！"));
      }
      return Future.error(e);
    }
  }

  Future<bool> checkNetwork(callback) async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    bool flag = connectivityResult != ConnectivityResult.none;
    if (!flag) {
      callback ?? callback(HttpError(HttpError.NETWORK_ERROR, '网络错误，稍后重试!'));
    }
    return Future.value(flag);
  }

  String _prepareUrl(String url, Map<String, dynamic> params) {
    if (params != null && params.isNotEmpty) {
      params.forEach((k, v) {
        if (url.indexOf(k) != -1) {
          url = url.replaceAll(':$k', v.toString());
        }
      });
    }
    return url;
  }
}

final Request Http = Request._instance;
