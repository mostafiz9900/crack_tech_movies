import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

  FutureOr<Request> authInterceptor(request) async {
    // final token = StorageService.box.pull(StorageItems.accessToken);

    // request.headers['X-Requested-With'] = 'XMLHttpRequest';
    // request.headers['Authorization'] = 'Bearer $token';

    return request;
  }
FutureOr<Request> requestInterceptor(request) async {
  // final token = StorageService.box.pull(StorageItems.accessToken);
  // request.headers['X-Requested-With'] = 'XMLHttpRequest';
  // request.headers['Authorization'] = 'Bearer $token';
  // EasyLoading.show(status: 'loading...');
  requestlLogger(request);
  return request;
}



FutureOr<dynamic> responseInterceptor(
    Request request, Response response) async {
  // EasyLoading.dismiss();
  responseLogger(response);
  if (response.statusCode != 200) {
    handleErrorStatus(response);
    return;
  }

  return response;
}

void handleErrorStatus(Response response) {
  switch (response.statusCode) {
    case 400:
    // final message = ErrorResponse.fromJson(response.body);
    // CommonWidget.toast(message.error);
      break;
    default:
  }
}
void requestlLogger(Request request) {
  debugPrint('Url: ${request.method} ${request.url}\n');
}
void responseLogger(Response response) {
  debugPrint('Status Code: ${response.statusCode}\n');
  debugPrint('Data: ${response.bodyString?.toString() ?? ''}');
}