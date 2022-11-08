/// Author:    Nabraj Khadka
/// Created:   08.11.2022
/// Description:
///

import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// custom dio client for our custom Interceptors, FormData, Request Cancellation, Timeout etc
class DioClient {
  final String baseUrl;

  late Dio _dio;

  // final List<Interceptor>? interceptors;
  final Interceptor? interceptor;

  DioClient({
    required this.baseUrl,
    required Dio dio,
    this.interceptor,
  }) {
    _dio = dio;
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = 60000
      ..options.receiveTimeout = 60000
      ..httpClientAdapter
      ..options.headers = {'Accept': 'application/json'};

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
          requestBody: true));
    }
    // handle certificate verification check (for http request)
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options ?? Options(headers: {"requiresToken": false}),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
