import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_online/app/modules/home/views/movie_details_view.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../app_pkg.dart';

class MovieListCard extends StatelessWidget {
 final Movie? movie;
  const MovieListCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 12 ),
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColorConstants.gray200),
        ),
        child:Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: ()=> Get.to(()=>MovieDetailsView(movie: movie,)),
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  //Movie Image
                  ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: SizedBox(
                          width: 115,
                          height: 133,
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
                  AppSpace.spaceW16,
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(movie?.title??"",
                            maxLines: 2,overflow: TextOverflow.ellipsis, style: Get.textTheme.displayMedium,),
                          AppSpace.spaceH6,
                          // Movie Year
                          RichText(maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                  text:"${StringConstants.year} ",
                                  style: Get.textTheme.displaySmall!.copyWith(color: ColorConstants.gray500),
                                  children: [
                                    TextSpan(
                                      text: movie?.year ?? "",
                                      style: Get.textTheme.displaySmall,
                                    ),]
                              )),
                          AppSpace.spaceH6,
                          // Movie director
                          RichText(maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                  text:"${StringConstants.director}\n",
                                  style: Get.textTheme.displaySmall!.copyWith(color: ColorConstants.gray500),
                                  children: [
                                    TextSpan(
                                      text: movie?.director ??"",
                                      style: Get.textTheme.displaySmall,
                                    ),]
                              )),
                          AppSpace.spaceH6,


                        ],),
                    ),
                  )
                ],
              ),
            ),
          ),
        ) ,
      ),
    );
  }
}