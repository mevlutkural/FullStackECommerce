class RegisterRequest {
  final String email;
  final String password;
  final String confirmPassword;
  final String fullName;

  RegisterRequest({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.fullName,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'fullName': fullName,
    };
  }
}
