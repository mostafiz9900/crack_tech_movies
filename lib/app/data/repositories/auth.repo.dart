import '../models/request/login_request.dart';
import '../models/response/login_response.dart';
import '../providers/auth.provider.dart';

class AuthRepository {
  AuthRepository({required this.authProvider});

  final AuthProvider authProvider;

  Future<LoginResponse?> login(LoginRequest data) async {
   final res = await authProvider.login('/api/login', data);
   if (res.statusCode == 200) {
    return LoginResponse.fromJson(res.body);
   }
  }

  Future<dynamic> register(dynamic data) async {
   final res = await authProvider.register('/api/register', data);
   if (res.statusCode == 200) {
    return null;
    // RegisterResponse.fromJson(res.body)
   }
  }

  Future<dynamic> getUsers() async {
   final res = await authProvider.getUsers('/api/users?page=1&per_page=12');
   if (res.statusCode == 200) {
    return null;
    // UsersResponse.fromJson(res.body)
   }
  }
 }