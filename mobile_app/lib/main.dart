import 'package:flutter/material.dart';
import 'package:mobile_app/common/clients/dio_client.dart';
import 'package:mobile_app/features/auth/data/repositories/auth_repository.dart';
import 'package:mobile_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:mobile_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:mobile_app/features/auth/services/auth_service.dart';
import 'package:mobile_app/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final DioClient dioClient = DioClient();

  @override
  Widget build(BuildContext context) {
    final authService = AuthService(dioClient);
    final authRepository = AuthRepository(authService);
    final loginUseCase = LoginUseCase(authRepository);
    final registerUseCase = RegisterUseCase(authRepository);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: LoginScreen(loginUseCase: loginUseCase),
      initialRoute: AppRoutes.login,
      routes: AppRoutes.getRoutes(
          loginUseCase: loginUseCase, registerUseCase: registerUseCase),
    );
  }
}
