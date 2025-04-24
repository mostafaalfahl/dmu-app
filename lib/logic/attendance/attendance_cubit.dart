import 'package:bloc/bloc.dart';
import 'package:d_m_u_attendance_app/apis/attendance_api.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit(this.attendanceApi) : super(AttendanceInitial());

  final AttendanceApi attendanceApi;

  Future<void> openAttendance() async {
    emit(AttendanceLoading());
    try {
      var messageMap = await attendanceApi.openAtendance();
      String mess = messageMap['message'];
      emit(AttendanceSuccess(message: mess));
    } on DioException catch (e) {
      emit(
        AttendanceFailure(
          errMessage: e.response!.data['message'],
        ),
      );
    }
  }

  Future<void> closeAttendance() async {
    emit(AttendanceLoading());
    try {
      var messageMap = await attendanceApi.closeAtendance();
      String mess = messageMap['message'];
      emit(AttendanceSuccess(message: mess));
    } on DioException catch (e) {
      emit(
        AttendanceFailure(
          errMessage: e.response!.data['message'],
        ),
      );
    }
  }
}
