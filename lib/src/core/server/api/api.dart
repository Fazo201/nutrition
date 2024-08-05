import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:l/l.dart';

import '../../storage/app_storage.dart';
import '../interceptors/connectivity_interceptor.dart';
import 'api_connection.dart';
import 'api_constants.dart';

@immutable
class ApiService {
  const ApiService._();

  static Future<Dio> initDio() async {
    final _dio = Dio(
      BaseOptions(
        baseUrl: ApiConst.baseUrl,
        headers: await ApiService.getHeaders(),
        connectTimeout: ApiConst.connectionTimeout,
        receiveTimeout: ApiConst.sendTimeout,
        sendTimeout: ApiConst.sendTimeout,
        validateStatus: (status) => status != null && status < 205,
      ),
    );

    _dio.interceptors.addAll(
      [
        ConnectivityInterceptor(
          requestReceiver: Connection(
            dio: _dio,
            connectivity: Connectivity(),
          ),
        ),
      ],
    );

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    return _dio;
  }

  static Future<Map<String, String>> getHeaders({bool isUpload = false}) async {
    final headers = <String, String>{
      'Content-type': isUpload ? 'multipart/form-data' : 'application/json; charset=UTF-8',
      'Accept': isUpload ? 'multipart/form-data' : 'application/json; charset=UTF-8',
    };

    final token = await AppStorage.$read(key: StorageKey.accessToken) ?? "";

    if (token.isNotEmpty) {
      headers.putIfAbsent('Authorization', () => 'Bearer $token');
    }

    return headers;
  }

  static Future<String?> get(String api, Map<String, dynamic> params) async {
    try {
      final response = await (await initDio()).get<dynamic>(api, queryParameters: params);
      return jsonEncode(response.data);
    } on TimeoutException catch (_) {
      l.e('The connection has timed out, Please try again!');
      rethrow;
    } on DioError catch (e) {
      l.e(e.response.toString());
      rethrow;
    } on Object catch (e) {
      l.e(e.toString());
      rethrow;
    }
  }

  static Future<String?> post(String api, Map<String, dynamic> data, [Map<String, dynamic> params = const <String, dynamic>{}]) async {
    try {
      final response = await (await initDio()).post<dynamic>(api, data: data, queryParameters: params);
      return jsonEncode(response.data);
    } on TimeoutException catch (_) {
      l.e('The connection has timed out, Please try again!');
      rethrow;
    } on DioError catch (e) {
      l.e(e.response.toString());
      rethrow;
    } on Object catch (_) {
      rethrow;
    }
  }

  static Future<String?> multipart(
      String api,
      List<File> paths, {
        bool picked = false,
      }) async {
    final formData = paths.mappedFormData(isPickedFile: picked);

    try {
      final response = await Dio(
        BaseOptions(
          baseUrl: ApiConst.baseUrl,
          validateStatus: (status) => status! < 203,
          headers: await getHeaders(isUpload: true),
        ),
      ).post<String?>(
        api,
        data: formData,
        onSendProgress: (int sentBytes, int totalBytes) {
          final progressPercent = sentBytes / totalBytes * 100;
          l.i('Progress: $progressPercent %');
        },
        onReceiveProgress: (int sentBytes, int totalBytes) {
          final progressPercent = sentBytes / totalBytes * 100;
          l.i('Progress: $progressPercent %');
        },
      ).timeout(
        const Duration(minutes: 10),
        onTimeout: () {
          throw TimeoutException(
            'The connection has timed out, Please try again!',
          );
        },
      );

      return jsonEncode(response.data);
    } on DioError catch (e) {
      l.e(e.response.toString());
      rethrow;
    } on Object catch (_) {
      rethrow;
    }
  }

  static Future<String?> put(String api, Map<String, dynamic> data) async {
    try {
      final response = await (await initDio()).put<dynamic>(api, data: data);

      return jsonEncode(response.data);
    } on TimeoutException catch (_) {
      l.e('The connection has timed out, Please try again!');
      rethrow;
    } on DioError catch (e) {
      l.e(e.response.toString());
      rethrow;
    } on Object catch (_) {
      rethrow;
    }
  }

  static Future<String?> putAccount(
      String api,
      Map<String, dynamic> params,
      ) async {
    try {
      final response = await (await initDio()).put<dynamic>(api, queryParameters: params);

      return jsonEncode(response.data);
    } on TimeoutException catch (_) {
      l.e('The connection has timed out, Please try again!');
      rethrow;
    } on DioError catch (e) {
      l.e(e.response.toString());
      rethrow;
    } on Object catch (_) {
      rethrow;
    }
  }

  static Future<String?> delete(String api, Map<String, dynamic> params) async {
    try {
      final _ = await (await initDio()).delete<dynamic>(api, queryParameters: params);
      return 'success';
    } on TimeoutException catch (_) {
      l.e('The connection has timed out, Please try again!');
      rethrow;
    } on DioError catch (e) {
      l.e(e.response.toString());
      rethrow;
    } on Object catch (_) {
      rethrow;
    }
  }
}

extension ListFileToFormData on List<File> {
  Future<FormData> mappedFormData({required bool isPickedFile}) async => FormData.fromMap(
    <String, MultipartFile>{
      for (var v in this) ...{
        DateTime.now().toString(): MultipartFile.fromBytes(
          isPickedFile ? v.readAsBytesSync() : (await rootBundle.load(v.path)).buffer.asUint8List(),
          filename: v.path.substring(v.path.lastIndexOf('/')),
        ),
      },
    },
  );
}