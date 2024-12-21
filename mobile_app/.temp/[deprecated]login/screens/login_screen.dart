import 'package:flutter/material.dart';
import 'package:mobile_app/common/components/button.dart';
import 'package:mobile_app/features/auth/login/components/login_form.dart';
import 'package:mobile_app/features/home/screens/home_screen.dart';
import '../../../../common/components/input_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _login(String email, String password) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login successful!')),
    );

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LoginForm(
            onSubmit: _login,
          )),
    );
  }
}
