

/// 业务异常
class RestException implements Exception {

  final String msg;

  RestException({required this.msg});

}

/// 网络异常
class HttpException implements Exception {

  final String msg;

  HttpException({required this.msg});

}