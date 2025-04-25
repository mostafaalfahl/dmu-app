import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:d_m_u_attendance_app/apis/auth_api.dart';
import 'package:d_m_u_attendance_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._api) : super(AuthInitial());

  final ApiService _api;
  late String role;

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final data = await _api.login(email: email, password: password);
      final user = User.fromJson(data['user']);
      final token = data['token'] as String;

      // persist token
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      role = user.role;

      emit(AuthAuthenticated(user));
    } catch (e) {
      log(e.toString());
      emit(const AuthFailure('Wrong Password/Email'));
    }
  }

  Future<void> logout() async {
    // clear local token
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');

    // optionally tell server
    // final token = prefs.getString('token');
    // if (token != null) await _api.logout(token);

    emit(AuthUnauthenticated());
  }
}
