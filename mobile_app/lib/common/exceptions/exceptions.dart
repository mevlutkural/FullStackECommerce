import 'package:dio/dio.dart';

class ApiException extends DioException {
  final String message;

  ApiException(this.message)
      : super(
          requestOptions: RequestOptions(path: ''),
        );

  @override
  String toString() => 'ApiException: $message';
}

class NetworkException extends DioException {
  final String message;

  NetworkException(this.message)
      : super(
          requestOptions: RequestOptions(path: ''),
        );

  @override
  String toString() => 'NetworkException: $message';
}
