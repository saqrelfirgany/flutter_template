import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// Abstract class defining the contract for a Dio-based HTTP client.
abstract class DioClient {
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
}

/// Implementation of the DioClient interface using Dio package.
class DioClientImpl implements DioClient {
  final Dio _dio;
  final String baseUrl;
  final String? authToken;
  final List<Interceptor>? interceptors;

  /// Constructor to initialize Dio client with optional interceptors and authentication token.
  DioClientImpl({
    required this.baseUrl,
    this.authToken,
    this.interceptors,
  }) : _dio = Dio() {
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = const Duration(seconds: 120)
      ..options.receiveTimeout = const Duration(seconds: 120)
      ..options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        if (authToken != null) 'Authorization': 'Bearer $authToken',
      };

    if (interceptors != null) _dio.interceptors.addAll(interceptors!);

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        error: true,
        compact: true,
      ));
    }
  }

  /// Performs a GET request to the specified URL with optional query parameters.
  @override
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Performs a POST request with optional data and query parameters.
  @override
  Future<dynamic> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Performs a PUT request with optional data and query parameters.
  @override
  Future<dynamic> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Performs a DELETE request with optional data and query parameters.
  @override
  Future<dynamic> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Handles the response and throws a [NetworkException] if necessary.
  dynamic _handleResponse(Response response) {
    final responseData = _parseResponse(response);

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return responseData;
    } else {
      throw NetworkException(
        statusCode: response.statusCode,
        message: responseData['message'] ?? 'Unknown error occurred',
        errors: responseData['errors']?.cast<String>(),
      );
    }
  }

  /// Parses the response data, ensuring it is properly decoded.
  dynamic _parseResponse(Response response) {
    try {
      return jsonDecode(jsonEncode(response.data));
    } catch (_) {
      return response.data;
    }
  }

  /// Handles Dio exceptions and maps them to a [NetworkException].
  NetworkException _handleError(DioException error) {
    if (error.error is SocketException) {
      return NetworkException(message: 'No internet connection');
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException(message: 'Connection timeout');
      case DioExceptionType.badResponse:
        return NetworkException(
          statusCode: error.response?.statusCode,
          message: error.response?.statusMessage ?? 'Server error occurred',
        );
      default:
        return NetworkException(message: 'Unexpected error occurred');
    }
  }
}

/// Custom exception class for handling network-related errors.
class NetworkException implements Exception {
  final int? statusCode;
  final String message;
  final List<String>? errors;

  NetworkException({
    this.statusCode,
    required this.message,
    this.errors,
  });

  @override
  String toString() => 'NetworkException: $message (${errors?.join(', ')})';
}
