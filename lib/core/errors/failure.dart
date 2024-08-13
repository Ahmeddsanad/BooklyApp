import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioError e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with API Server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with API Server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with API Server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate with API Server');
      case DioExceptionType.badResponse:
      //handling this case
      case DioExceptionType.cancel:
        return ServerFailure('Request with API Server');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure('Oops! There was an Error, Please try again');
    }
  }
}

// class CacheFailure extends Failure {}

// class NetworkFailure extends Failure {}
