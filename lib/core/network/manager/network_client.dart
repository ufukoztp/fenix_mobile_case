import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fenix_mobile_case/core/base/enum/http_call_type/http_call_type.dart';
import 'package:fenix_mobile_case/core/base/model/base_result.dart';

final class NetworkClient {
  NetworkClient({
    required Dio dio,
  })  :
        _dio = dio {
  }

  final Dio _dio;

  // Call:----------------------------------------------------------------------

  Future<Result<T, AppException>> call<T>({
    required String path,
    required HttpCallType callType,
    required T Function(dynamic json) mapper,
    bool? withOutMapper = false,
    dynamic data,
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    String? contentType,
    String? savePath,
  }) async {
    try {
      // bool hasConnection = await connectionCheckHelper.checkConnectivity();
      // if (hasConnection == true) {
      //   mapper = (json) {
      //     return false as T;
      //   };
      //   throw DioException(
      //       requestOptions: RequestOptions(),
      //       response: Response(requestOptions: RequestOptions(), data: {
      //         'error': 'İnternet Bağlantınız bulunmamaktadır.',
      //         'success': false
      //       }));
      // }

      late Response<dynamic> dioResponse;
      final queryParams = _generateQueryParam(param: queryParameters);
      final headers = await _generateHeaders();
      final options = Options(headers: headers, contentType: contentType);

      if (callType == HttpCallType.GET) {
        dioResponse = await _get(
          path,
          queryParameters: queryParams,
          options: options,
          onReceiveProgress: onReceiveProgress,
        );
      }

      if (callType == HttpCallType.POST) {
        dioResponse = await _post(
          path,
          queryParameters: queryParams,
          options: options,
          onReceiveProgress: onReceiveProgress,
          data: data,
        );
      }

      if (callType == HttpCallType.PUT) {
        dioResponse = await _put(
          path,
          queryParameters: queryParams,
          options: options,
          onReceiveProgress: onReceiveProgress,
          data: data,
        );
      }

      if (callType == HttpCallType.DELETE) {
        dioResponse = await _delete(
          path,
          queryParameters: queryParams,
          options: options,
          data: data,
        );
      }
      if (callType == HttpCallType.PATCH) {
        dioResponse = await _patch(
          path,
          queryParameters: queryParams,
          options: options,
          data: data,
        );
      }
      if (callType == HttpCallType.DOWNLOAD) {
        dioResponse = await _download(
          path,
          savePath,
          queryParameters: queryParams,
          options: options,
          data: data,
        );
      }

      // final fromResponse = Result.fromResponse(dioResponse, mapper);
      // return fromResponse;
      return _handleResponse(dioResponse, mapper, withOutMapper!);
    } on DioException catch (exception) {
      return _handleErrors(exception, mapper);
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response<T>> _get<T>(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        void Function(int, int)? onReceiveProgress,
      }) async {
    final response = await _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );

    return response;
  }

  // Post:----------------------------------------------------------------------
  Future<Response<T>> _post<T>(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        void Function(int, int)? onSendProgress,
        void Function(int, int)? onReceiveProgress,
      }) async {
    final response = await _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  // Put:-----------------------------------------------------------------------
  Future<Response<T>> _put<T>(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        void Function(int, int)? onSendProgress,
        void Function(int, int)? onReceiveProgress,
      }) async {
    final response = await _dio.put<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  // Delete:--------------------------------------------------------------------
  Future<Response<T>> _delete<T>(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    final response = await _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    return response;
  }

  // Patch:---------------------------------------------------------------------
  Future<Response<T>> _patch<T>(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        void Function(int, int)? onSendProgress,
        void Function(int, int)? onReceiveProgress,
      }) async {
    final response = await _dio.patch<T>(
      path,
      queryParameters: queryParameters,
      data: data,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  // Download:------------------------------------------------------------------
  Future<Response<dynamic>> _download<T>(
      String urlPath,
      dynamic savePath, {
        void Function(int, int)? onReceiveProgress,
        Map<String, dynamic>? queryParameters,
        CancelToken? cancelToken,
        bool deleteOnError = true,
        String lengthHeader = Headers.contentLengthHeader,
        dynamic data,
        Options? options,
      }) async {
    final response = await _dio.download(
      urlPath,
      savePath,
      // onReceiveProgress: onReceiveProgress,
      // queryParameters: queryParameters,
      // cancelToken: cancelToken,
      // deleteOnError: deleteOnError,
      // // lengthHeader: lengthHeader,
      // data: data,
      // options: options,
    );

    return response;
  }

  Future<Map<String, dynamic>> _generateHeaders() async {
    final headers = <String, dynamic>{
      //'x-api-key': '222f8997-bc82-4836-9884-e42468af44c7',
    };
    return headers;
  }

  Map<String, dynamic> _generateQueryParam(
      {Map<String, dynamic>? param})  {
    final queryParams = <String, dynamic>{
      //'x-api-key': '222f8997-bc82-4836-9884-e42468af44c7',
      "api_key":"ae304e3f4d3830d95075ae6914b55ddf",
    };
    queryParams.addAll(param??{});
    return queryParams;
  }

  Future<Result<T, AppException>> _handleResponse<T>(
      Response<dynamic>? dioResponse,
      T Function(dynamic) mapper,
      bool withOutMapper,
      ) async {
    late Result<T, AppException> response;
    if (withOutMapper) {
      switch (dioResponse?.statusCode) {
        case HttpStatus.ok:
        case HttpStatus.accepted:
        case HttpStatus.noContent:
        // dioResponse?.data = {'result': true};
        // response = Result.fromResponse(dioResponse, mapper);
          response = Success(dioResponse?.data as T);
      }
    } else {
      response = Result.fromResponse(dioResponse, mapper);
    }

    return response;
  }

  Future<Result<T, AppException>> _handleErrors<T>(
      DioException exception,
      T Function(dynamic) mapper,
      ) async {
    switch (exception.response?.statusCode) {
      case HttpStatus.unauthorized:
      // case HttpStatus.forbidden:

        throw exception;

      default:
    }

    return Result.fromResponse(exception.response, mapper);
  }
}
