import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../app_pkg.dart';
import '../../../global_widgets/custom_chip_button.dart';

class MovieDetailsView extends StatelessWidget {
  final Movie? movie;
  const MovieDetailsView({super.key,required this.movie});

  @override
  Widget build(BuildContext context) {
    double imageSize = Get.height * 0.4;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(alignment: Alignment.topCenter,
                child: SizedBox(
                  width: Get.width,
                  height: imageSize,
                  child: Hero(
                    tag: "${movie?.title}${movie?.year}",
                    child: CachedNetworkImage(
                      imageUrl: movie?.posterUrl ?? "",
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer(
                        gradient: const LinearGradient(colors: ColorConstants.shimmerGradient) ,
                        child: Container(
                          color: ColorConstants.shimmerBgColor,
                        ),),
                      errorWidget: (context, url, error) => Image.asset(AppAssets.noImagePlaceholder,fit: BoxFit.cover),
                    ),
                  ),
                )),
            Positioned(
              top: 16,
              left: 16,
              child: InkWell(
                onTap: () => Get.back(),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: ColorConstants.gray700,
                  child: SvgPicture.asset(AppAssets.backArrowIcon, color: Colors.white,width: 8),
                ),
              ),
            ),
            Positioned(
              top: imageSize-20,
              left: 0,
              right: 0,
              child: Container(
                width: Get.width,
                height: Get.height,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration:  BoxDecoration(
                  color: ColorConstants.white,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(16),topRight:Radius.circular(16) )
                ),
                child: ListView(
                  children: [
                    AppSpace.spaceH30,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate( movie?.genres?.length ?? 0 , (index) {
                          String? genres = movie?.genres?[index];
                          return  CustomChipButton(
                            text: genres,
                          );}),
                      ),
                    ),
                    AppSpace.spaceH12,
                    Text(movie?.title ?? "",maxLines: 2,overflow: TextOverflow.ellipsis,style: Get.textTheme.displayLarge,),
                    AppSpace.spaceH6,
                    RichText(maxLines: 3, overflow: TextOverflow.ellipsis,
                        text: TextSpan(text:"${StringConstants.year} ",
                            style: Get.textTheme.displaySmall!.copyWith(color: ColorConstants.gray500),
                            children: [
                              TextSpan(text: movie?.year ??"",
                                style: Get.textTheme.displaySmall,),]
                        )),
                    AppSpace.spaceH10,
                    titleCard(title: StringConstants.director, subTitle: movie?.director),
                    AppSpace.spaceH10,
                    titleCard(title: StringConstants.actors, subTitle: movie?.actors),
                    AppSpace.spaceH10,
                    titleCard(title: StringConstants.plot, subTitle: movie?.plot),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget titleCard({String? title, String? subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title ?? "",style:Get.textTheme.displayMedium!.copyWith(color: ColorConstants.gray900,fontWeight: FontWeight.w700),),
        if(subTitle != null)
          AppSpace.spaceH6,
        if(subTitle != null)
          Text(subTitle ?? "",style:Get.textTheme.displaySmall,),
      ],
    );
  }

}
