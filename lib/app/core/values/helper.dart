import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_online/app/core/core.dart';

import '../../app_pkg.dart';

class Helpers {
  Helpers._();

  static void miniSuccessSnackBar({
    String massage = "Successfully Verified",
    double width = 260,
  }) {
    Get.rawSnackbar(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      maxWidth: width,
      borderColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      snackPosition: SnackPosition.TOP,
      messageText: Container(
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: ColorConstants.black.withOpacity(0.10),
              blurRadius: 15,
              offset: const Offset(5, 10)),
        ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
             Icon(Icons.check_circle,
                color: ColorConstants.greenColor, size: 20),
            AppSpace.spaceW8,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(massage,
                        style: Get.textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: ColorConstants.darkGray)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

  static void miniErrorSnackBarFor({
    String massage = "Something Is Wrong",
    double width = 260,
  }) {
    Get.rawSnackbar(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      maxWidth: width,
      borderColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      snackPosition: SnackPosition.TOP,
      messageText: Container(
        height: 45,
        padding:const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: ColorConstants.black.withOpacity(0.10),
              blurRadius: 15,
              offset: const Offset(5, 10)),
        ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
             Icon(Icons.cancel,
                color: ColorConstants.redColor, size: 20),
            AppSpace.spaceW8,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(massage,
                        style: Get.textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: ColorConstants.darkGray)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

}