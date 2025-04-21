// lib/services/api_service.dart
import 'package:d_u/apis/base_api.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    headers: {
      'Content-Type': 'application/json',
    },
  ));

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final resp = await _dio.post('/login/', data: {
      'email': email,
      'password': password,
    });
    return resp.data; // { "user": {...}, "token": "..." }
  }

  /// If your backend supports a logout endpoint, you could call it here.
  /// Otherwise this is just a placeholder.
  Future<void> logout(String token) async {
    // e.g. await _dio.post('/logout/', options: Options(headers: { 'Authorization': 'Token $token'}));
    return;
  }
}
