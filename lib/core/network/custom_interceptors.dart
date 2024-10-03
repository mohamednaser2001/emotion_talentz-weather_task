
import 'package:dio/dio.dart';

import '../methods/check_internet_connection.dart';
import 'error/dio_error_handler.dart';
import 'error/failure.dart';
import 'error_message_model.dart';

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!await internetConnected()) {
      return handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          error: "No internet connection",
        ),
      );
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200 || response.statusCode== 201) {
      handler.next(response);
    } else {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: ServerFailure(errorMessageModel: ErrorMessageModel.fromJson(response.data)),
        ),
      );
    }
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    ErrorMessageModel errorDescription = DioErrorHandler.handleDioError(error);
    return handler.next(DioException(
      requestOptions: error.requestOptions,
      response: error.response,
      type: error.type,
      error: errorDescription,
    ));
  }
}
