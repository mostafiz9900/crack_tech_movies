
import 'package:get/get.dart';
import 'package:movie_online/app/data/providers/base_provider.dart';

import '../data.dart';

class AuthProvider extends BaseProvider{
  Future<Response> login(String path, LoginRequest data) {
    return post(path, data.toJson());
  }

  Future<Response> register(String path, LoginRequest data) {
    return post(path, data.toJson());
  }

  Future<Response> getUsers(String path) {
    return get(path);
  }
}