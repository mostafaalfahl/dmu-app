import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AttendanceApi {
  AttendanceApi({required this.dio});

  final Dio dio;

  Future<dynamic> openAtendance() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    log(token ?? 'Token is null');

    var res = await dio.patch(
      'https://attendance-project.up.railway.app/api/doctor/open-attendance/2',
      data: {
        'time': '5',
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return res.data;
  }

  Future<dynamic> closeAtendance() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var res = await dio.patch(
      'https://attendance-project.up.railway.app/api/doctor/close-attendance/2',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return res.data;
  }
}
