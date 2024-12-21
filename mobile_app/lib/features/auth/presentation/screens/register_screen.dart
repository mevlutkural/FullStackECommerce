import 'package:flutter/material.dart';
import 'package:mobile_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:mobile_app/features/auth/presentation/widgets/register_form.dart';

class RegisterScreen extends StatefulWidget {
  final RegisterUseCase registerUseCase;

  const RegisterScreen({Key? key, required this.registerUseCase})
      : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  String? errorMessage;

  Future<void> handleRegister() async {
    try {
      final user = await widget.registerUseCase(
        emailController.text,
        passwordController.text,
        confirmPasswordController.text,
        fullNameController.text,
      );
      // Başarılı kayıt
      print('User registered: ${user.email}');
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            RegisterForm(
              emailController: emailController,
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
              fullNameController: fullNameController,
              onRegister: handleRegister,
            ),
          ],
        ),
      ),
    );
  }
}
