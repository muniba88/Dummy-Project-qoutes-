import '../../../core/config/app_config.dart';
import '../../../core/services/base_api_service.dart';

class AuthService extends BaseApiService {
  final AppConfig _config = AppConfig();

  Future<dynamic> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    return postMethod(
      _config.registerEndpoint,
      body: {'email': email, 'password': password, 'name': name},
    );
  }

  Future<dynamic> logIn({
    required String email,
    required String password,
  }) async {
    return postMethod(
      _config.loginEndpoint,
      body: {'email': email, 'password': password},
    );
  }
}