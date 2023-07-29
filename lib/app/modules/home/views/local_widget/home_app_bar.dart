import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../app_pkg.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {}, icon: SvgPicture.asset(AppAssets.menuIcon)),
      title: Text(
        'Movie Online',
        style:
        Get.textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w600),
      ),
      actions: const [
        CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage(AppAssets.demoProfileImage2),
        ),
        AppSpace.spaceW16
      ],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}