import 'package:flutter/material.dart';
import 'package:mobile_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:mobile_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:mobile_app/features/auth/presentation/screens/login_screen.dart';
import 'package:mobile_app/features/auth/presentation/screens/register_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';

  static Map<String, WidgetBuilder> getRoutes({
    required LoginUseCase loginUseCase,
    required RegisterUseCase registerUseCase,
  }) {
    return {
      login: (context) => LoginScreen(loginUseCase: loginUseCase),
      register: (context) => RegisterScreen(registerUseCase: registerUseCase),
    };
  }
}
