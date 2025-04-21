import 'package:flutter/material.dart';

import 'package:d_u/views/Welcome/the_welcome_screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'apis/auth_api.dart';
import 'logic/auth/auth_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    BlocProvider(
      create: (_) => AuthCubit(ApiService()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
