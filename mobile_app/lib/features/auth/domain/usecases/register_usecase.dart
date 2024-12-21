import '../entities/user.dart';
import '../../data/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  Future<User> call(
      String email, String password, String confirmPassword, String fullName) {
    return _repository.register(email, password, confirmPassword, fullName);
  }
}
