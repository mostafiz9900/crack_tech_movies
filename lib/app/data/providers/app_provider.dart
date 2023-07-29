
import 'base_provider.dart';

class AppProvider extends BaseProvider {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
    httpClient.timeout = Duration(microseconds: 1);
  }
}
