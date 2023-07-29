
import 'package:get/get.dart';

import 'app_pkg.dart';


class DependencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => StorageService().init());
    Get.put<ThemeServices>(ThemeServices(),permanent: true);
  }
}