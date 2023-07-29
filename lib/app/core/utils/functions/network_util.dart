import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkUtil {
  static Future<bool> checkNetworkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}