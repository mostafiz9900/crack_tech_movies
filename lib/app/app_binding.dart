
import 'package:get/get.dart';
import 'package:movie_online/app/data/providers/home_provider.dart';

import 'data/data.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    //provider
    Get.put(AuthProvider(), permanent: true);
    Get.put(HomeProvider(), permanent: true);
    //Repository
    Get.put(AuthRepository(authProvider: Get.find()), permanent: true);
  }
}