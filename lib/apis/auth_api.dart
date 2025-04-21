import 'package:d_m_u_attendance_app/apis/base_api.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final resp = await _dio.post(
      '/login/',
      data: {
        'email': email,
        'password': password,
      },
    );
    return resp.data; 
  }

  Future<void> logout(String token) async {
    return;
  }
}
