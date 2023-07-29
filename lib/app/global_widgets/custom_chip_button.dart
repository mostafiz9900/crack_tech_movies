import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_pkg.dart';

class CustomChipButton extends StatelessWidget {
  final bool isActive;
  final String? text;
  final VoidCallback? onTap;
  const CustomChipButton({
    super.key, this.isActive = false,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:8,),
      child: Container(
        decoration: BoxDecoration(
          color: isActive ?  Colors.black : null,
          border: isActive ? null : Border.all(width: 1.5,color: ColorConstants.gray300,strokeAlign: BorderSide.strokeAlignInside),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(50),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:16,vertical: isActive?  9 : 8 ),
              child: Text(text ?? "",maxLines: 1, style: Get.textTheme.displaySmall!.copyWith(
                  color: isActive ?  ColorConstants.white : ColorConstants.gray700 ,
                  fontWeight: FontWeight.w500
              )),
            ),
          ),
        ),
      ),
    );
  }
}