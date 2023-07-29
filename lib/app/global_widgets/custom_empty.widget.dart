import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyScreenWidget extends StatelessWidget {
  const EmptyScreenWidget({super.key, this.showButton = true});

  final bool showButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.06),
              spreadRadius: 8,
              blurRadius: 7,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/not_found.gif",
                height: 200,
                width: 200,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 30),
              Text(
                "Result not found",
                style: Get.theme.textTheme.displaySmall!.copyWith(fontSize: 25),
              ),
              Text(
                "Whoops... this information is not available for a moment",
                style: Get.theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 14,
                    color: Get.textTheme.bodyLarge!.color!.withOpacity(0.5)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              // Visibility(
              //   visible: showButton==true,
              //   child: CustomButton(
              //     title: "Go Back",
              //     onPressed: (){
              //       Get.back();
              //     },
              //     radius: 30,
              //     width: 200,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
