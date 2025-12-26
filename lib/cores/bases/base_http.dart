
import 'package:app/cores/error/http.dart';
import 'package:app/cores/toast/toast.dart';
import 'package:app/cores/utils/desk_util.dart';
import 'package:app/cores/utils/sign_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:get/get.dart' hide Response;

/// JSON处理
typedef FromJson<T> = T Function(Map<String, dynamic> json);

/// 请求服务
class BaseHttp extends GetxService {
  /// DIO 请求实例
  late final Dio _dio;

  /// 构造函数
  BaseHttp() {
    /// 实例化请求实例
    _dio = Dio(
      BaseOptions(
        sendTimeout: const Duration(seconds: 5),
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    );

    /// 添加日志拦截器
    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(requestBody: true));
    }

    /// 添加请求拦截器
    _dio.interceptors.add(RequestInterceptors());

    /// 添加响应拦截器
    _dio.interceptors.add(ResponseInterceptors());

    /// 添加错误拦截器
    _dio.interceptors.add(ErrorInterceptors());
  }

  /// 设置请求地址
  void setBaseURL(String url) {
    _dio.options.baseUrl = url;
  }

  /// 获取基本地址
  String get baseUrl => _dio.options.baseUrl;

  /// 设置基本地址
  set baseUrl(String url) => _dio.options.baseUrl = url;

  /// GET 请求
  Future<T?> get<T>(String path, {
    Map<String, dynamic>? query,
    Options? options,
    FromJson? fromJson,
  }) async {
    final res = await _dio.get(path, queryParameters: query, options: options);
    if (fromJson != null) {
      final data = res.data as Map<String, dynamic>;
      return fromJson(data);
    }
    return res.data;
  }

  /// GET 请求分页
  Future<Page<T>> getPage<T>(String path, {
    Map<String, dynamic>? query,
    Options? options,
    required FromJson<T> fromJson,
  }) async {
    final res = await _dio.get(path, queryParameters: query, options: options);
    final data = res.data as Map<String, dynamic>;
    return Page<T>.fromJson(data, fromJson);
  }

  /// GET 请求列表
  Future<List<T>> getList<T>(String path, {
    Map<String, dynamic>? query,
    Options? options,
    required FromJson<T> fromJson,
  }) async {
    final res = await _dio.get(path, queryParameters: query, options: options);
    final list = res.data as List<dynamic>;
    return list.map((it) => fromJson(it as Map<String, dynamic>)).toList();
  }

  /// POST 请求
  Future<T?> post<T>(String path, {
    Object? data,
    Map<String, dynamic>? query,
    Options? options,
    FromJson? fromJson,
  }) async {
    final res = await _dio.post(
      path,
      data: data,
      queryParameters: query,
      options: options,
    );
    if (fromJson != null) {
      final data = res.data as Map<String, dynamic>;
      return fromJson(data);
    }
    return res.data;
  }

  /// PUT 请求
  Future<T?> put<T>(String path, {
    Object? data,
    Map<String, dynamic>? query,
    Options? options,
    FromJson? fromJson,
  }) async {
    final res = await _dio.put(
      path,
      data: data,
      queryParameters: query,
      options: options,
    );
    if (fromJson != null) {
      final data = res.data as Map<String, dynamic>;
      return fromJson(data);
    }
    return res.data;
  }

  /// PATCH 请求
  Future<T?> patch<T>(String path, {
    Object? data,
    Map<String, dynamic>? query,
    Options? options,
    FromJson? fromJson,
  }) async {
    final res = await _dio.patch(
      path,
      data: data,
      queryParameters: query,
      options: options,
    );
    if (fromJson != null) {
      final data = res.data as Map<String, dynamic>;
      return fromJson(data);
    }
    return res.data;
  }

  /// DELETE 请求
  Future<T?> delete<T>(String path, {
    Object? data,
    Map<String, dynamic>? query,
    Options? options,
    FromJson? fromJson,
  }) async {
    final res = await _dio.delete(
      path,
      data: data,
      queryParameters: query,
      options: options,
    );
    if (fromJson != null) {
      final data = res.data as Map<String, dynamic>;
      return fromJson(data);
    }
    return res.data;
  }
}

/// 请求拦截器
class RequestInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['id'] = DeskUtil.id;
    options.headers['name'] = DeskUtil.name;
    options.headers['info'] = DeskUtil.info;
    if (SignUtil.hasToken()) {
      options.headers['Authorization'] = 'Bearer ${SignUtil.getToken()}';
    }
    handler.next(options);
  }
}

/// 响应拦截器
class ResponseInterceptors extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    /// 判定返回，设置令牌效期
    final status = response.statusCode ?? 0;
    Get.log('响应: $status');
    if (status == 200) {
      SignUtil.setExpire();
      // Get.log('设置效期');
    }
    handler.next(response);
  }
}

/// 错误拦截器
class ErrorInterceptors extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final error = _handle(err, err.response);
    Toast.error(error.msg);
    handler.next(err);
  }

  HttpException _handle(DioException err, Response? resp) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return HttpException(msg: '请求超时');
      case DioExceptionType.connectionError:
        return HttpException(msg: '网络异常');
      case DioExceptionType.cancel:
        return HttpException(msg: '请求取消');
      case DioExceptionType.badCertificate:
        return HttpException(msg: '证书错误');
      case DioExceptionType.unknown:
        return HttpException(msg: '未知错误');
      case DioExceptionType.badResponse:
        if (resp == null) {
          return HttpException(msg: '错误响应');
        } else {
          if (resp.statusCode == 401) {
            return HttpException(msg: '未授权');
          }
          if (resp.statusCode == 403) {
            return HttpException(msg: resp.data['msg']);
          }
          if (resp.statusCode == 404) {
            return HttpException(msg: '找不到资源');
          }
          if (resp.statusCode == 500) {
            return HttpException(msg: '服务错误');
          }
          return HttpException(msg: '未知异常');
        }
    }
  }

}

/// 分页处理
class Page<T> {
  int page;
  int size;
  int pageNum;
  int dataNum;
  List<T> data;

  Page({
    required this.page,
    required this.size,
    required this.pageNum,
    required this.dataNum,
    required this.data,
  });

  factory Page.fromJson(Map<String, dynamic> json,
      T Function(Map<String, dynamic> json) fromJsonT) {
    final list = (json['data'] as List<dynamic>? ?? [])
        .map((e) => fromJsonT(e as Map<String, dynamic>))
        .toList();
    return Page<T>(
      page: json['page'],
      size: json['size'],
      pageNum: json['pageNum'],
      dataNum: json['dataNum'],
      data: list,
    );
  }

  Map<String, dynamic> toJson() =>
      {
        "page": page,
        "size": size,
        "pageNum": pageNum,
        "dataNum": dataNum,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}
