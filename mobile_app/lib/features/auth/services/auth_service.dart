import '../data/models/login_request.dart';
import '../data/models/register_request.dart';
import '../data/models/user_model.dart';
import '../../../common/clients/dio_client.dart';

class AuthService {
  final DioClient _dioClient;

  AuthService(this._dioClient);

  Future<UserModel> login(LoginRequest request) async {
    final response = await _dioClient.dio.post(
      '/auth/login',
      data: request.toJson(),
    );
    return UserModel.fromJson(response.data);
  }

  Future<UserModel> register(RegisterRequest request) async {
    final response = await _dioClient.dio.post(
      '/auth/register',
      data: request.toJson(),
    );
    return UserModel.fromJson(response.data);
  }
}
