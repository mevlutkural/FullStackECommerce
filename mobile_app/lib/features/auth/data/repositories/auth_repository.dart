import 'dart:convert';

import 'package:mobile_app/features/auth/data/models/login_request.dart';
import 'package:mobile_app/features/auth/data/models/register_request.dart';
import 'package:mobile_app/features/auth/data/models/user_model.dart';
import 'package:mobile_app/features/auth/domain/entities/user.dart';
import 'package:mobile_app/features/auth/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository(this._authService);

  Future<User> login(String email, String password) async {
    final LoginRequest request = LoginRequest(email: email, password: password);
    final UserModel userModel = await _authService.login(request);
    return User(
      id: userModel.id,
      email: userModel.email,
      fullName: userModel.fullName,
    );
  }

  Future<User> register(String email, String password, String confirmPassword,
      String fullName) async {
    final request = RegisterRequest(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      fullName: fullName,
    );
    final userModel = await _authService.register(request);
    return User(
      id: userModel.id,
      email: userModel.email,
      fullName: userModel.fullName,
    );
  }

  Future<void> saveAuthData(String token, User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', token);
    await prefs.setString('user', jsonEncode(user));
  }
}
