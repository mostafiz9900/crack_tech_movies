import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../../global_widgets/common.widget.dart';
import '../../../routes/app_pages.dart';
import 'package:connectivity_plus/connectivity_plus.dart' as connectivity;

class AuthController extends GetxController {
  final AuthRepository authRepository;
  AuthController({required this.authRepository});
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerConfirmPasswordController = TextEditingController();
  bool registerTermsChecked = false;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void register(BuildContext context) async {
    AppFocus.unfocus(context);
    if (registerFormKey.currentState!.validate()) {
      if (!registerTermsChecked) {
        CommonWidget.toast('Please check the terms first.');
        return;
      }

      final res = await authRepository.register(
        (
        email: registerEmailController.text,
        password: registerPasswordController.text,
        ),
      );


      final prefs = Get.find<SharedPreferences>();
      if (res!.token.isNotEmpty) {
        prefs.setString(StorageConstants.token, res.token);
        print('Go to Home screen>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
      }
    }
  }

  void login(BuildContext context) async {
    AppFocus.unfocus(context);
    if (loginFormKey.currentState!.validate()) {
      final res = await authRepository.login(
        LoginRequest(
          email: loginEmailController.text,
          password: loginPasswordController.text,
          deviceToken: ""),
      );

      final prefs = Get.find<SharedPreferences>();
      if (res!.token.isNotEmpty) {
        prefs.setString(StorageConstants.token, res.token);
        Get.toNamed(Routes.HOME);
      }
    }
  }

  @override
  void onClose() {
    super.onClose();

    registerEmailController.dispose();
    registerPasswordController.dispose();
    registerConfirmPasswordController.dispose();

    loginEmailController.dispose();
    loginPasswordController.dispose();
  }


  Future<bool> checkInternetConnection() async {
    final connectivity.ConnectivityResult connectivityResult =
    await connectivity.Connectivity().checkConnectivity();
    if (GetPlatform.isAndroid) {
      if (connectivityResult == connectivity.ConnectivityResult.mobile) {
        return true;
      } else if (connectivityResult == connectivity.ConnectivityResult.wifi) {
        return true;
      }else if (connectivityResult ==  connectivity.ConnectivityResult.ethernet) {
        return true;
      } else if (connectivityResult ==  connectivity.ConnectivityResult.vpn) {
        return true;
      } else if (connectivityResult ==  connectivity.ConnectivityResult.bluetooth) {
        return true;
      } else if (connectivityResult == connectivity.ConnectivityResult.other) {
        return true;
      } else if (connectivityResult == connectivity.ConnectivityResult.none) {
        return false;
      } else {
        return false;
      }
    } else {
      if (connectivityResult == connectivity.ConnectivityResult.mobile) {
        return true;
      } else if (connectivityResult == connectivity.ConnectivityResult.wifi) {
        return true;
      }  else if (connectivityResult ==  connectivity.ConnectivityResult.ethernet) {
        return true;
      } else if (connectivityResult ==  connectivity.ConnectivityResult.vpn) {
        return true;
      } else if (connectivityResult ==  connectivity.ConnectivityResult.bluetooth) {
        return true;
      }else if (connectivityResult == connectivity.ConnectivityResult.other) {
        return true;
      } else if (connectivityResult == connectivity.ConnectivityResult.none) {
        return false;
      } else {
        return false;
      }
    }
  }
}