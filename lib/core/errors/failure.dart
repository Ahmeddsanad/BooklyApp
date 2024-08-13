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
        return ServerFailure.fromResponse(
            e.response?.statusCode ?? 0, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request with API Server');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure('Oops! There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure(
          'Your Request was not found, please try again later');
    } else if (statusCode == 500) {
      return ServerFailure(
          'There is a problem with server, please try again later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure('There was an error, please try again later');
    }
  }
}

// class CacheFailure extends Failure {}

// class NetworkFailure extends Failure {}
