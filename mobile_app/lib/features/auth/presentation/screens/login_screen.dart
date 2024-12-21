import 'package:flutter/material.dart';
import 'package:mobile_app/common/helpers/error_handler.dart';
import 'package:mobile_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:mobile_app/features/auth/presentation/widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  final LoginUseCase loginUseCase;

  const LoginScreen({Key? key, required this.loginUseCase}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? errorMessage;

  Future<void> handleLogin() async {
    try {
      final user = await widget.loginUseCase(
        emailController.text,
        passwordController.text,
      );
      // Login başarılı, token ve user'ı sakla
      // Örnek için print, burada storage işlemi yapılacak
      print('User logged in: ${user.email}');
    } catch (e) {
      ErrorHandler.handle(e, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            LoginForm(
              emailController: emailController,
              passwordController: passwordController,
              onLogin: handleLogin,
            ),
          ],
        ),
      ),
    );
  }
}
