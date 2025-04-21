import 'package:d_m_u_attendance_app/apis/lecture_info_api.dart';
import 'package:d_m_u_attendance_app/logic/lecture/lecture_cubit.dart';
import 'package:d_m_u_attendance_app/views/Welcome/the_welcome_screens.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'apis/auth_api.dart';
import 'logic/auth/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthCubit(
            ApiService(),
          ),
        ),
        BlocProvider(
          create: (_) => LectureCubit(
            LectureInfoApi(
              dio: Dio(),
            ),
          )..getLecInfo(),
        )
      ],
      child: const Attendance(),
    ),
  );
}

class Attendance extends StatelessWidget {
  const Attendance({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
