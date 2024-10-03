// dio_error_handler.dart
import 'package:dio/dio.dart';

import '../error_message_model.dart';

class DioErrorHandler {


  static ErrorMessageModel handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return ErrorMessageModel(errors: "Request to the server was cancelled") ;
      case DioExceptionType.connectionTimeout:
        return ErrorMessageModel(errors: "Connection timeout with the server");
      case DioExceptionType.receiveTimeout:
        return ErrorMessageModel(errors: "Receive timeout in connection with the server");
      case DioExceptionType.badResponse:
        return handleServerError(error.response);
      case DioExceptionType.sendTimeout:
        return ErrorMessageModel(errors: "Send timeout in connection with the server");
      case DioExceptionType.connectionError:
        if (error.message!= null && error.message!.contains('SocketException')) {
          return ErrorMessageModel(errors: "No internet connection");
        }
        return ErrorMessageModel(errors: "Connection error");
      case DioExceptionType.unknown:
      default:
        return ErrorMessageModel(errors: "Unexpected error occurred");
    }
  }

  static ErrorMessageModel handleServerError(Response? response) {
    if (response == null) {
      return ErrorMessageModel(errors: "Unknown server error"); /// todo change text messages, and know status codes from backend.
    }
    switch (response.statusCode) {
      case 400:
        return ErrorMessageModel(errors: "Bad request");
      case 401:
        return ErrorMessageModel(errors: "Unauthorized");
      case 403:
        return ErrorMessageModel(errors: "Forbidden");
      case 404:
        return ErrorMessageModel(errors: "Not found");
        case 422:
        return ErrorMessageModel.fromJson(response.data);
      case 500:
        return ErrorMessageModel(errors: "Internal server error");
      case 502:
        return ErrorMessageModel(errors: "Bad gateway");
      case 503:
        return ErrorMessageModel(errors: "Service unavailable");
      default:
        return ErrorMessageModel(errors: "Received invalid status code: ${response.statusCode}");
    }
  }
}
