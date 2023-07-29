import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_pkg.dart';
import '../../../../global_widgets/custom_chip_button.dart';

class HomeBody extends StatelessWidget {
  final HomeController homeController;
  const HomeBody({
    super.key, required this.homeController,
  });

  @override
  Widget build(BuildContext context) {
    return homeController.isPageLoading?
    const Center(child: CircularProgressIndicator()):
    RefreshIndicator(
      onRefresh: () async{
        await homeController.getMovieList();
      },
      child: ListView(
        children: [
          AppSpace.spaceH8,
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 16,),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate( homeController.moviesListModel?.genres?.length ?? 0 , (index) {
                String? genres = homeController.moviesListModel?.genres?[index];
                return CustomChipButton(
                text: genres,
                isActive: genres == homeController.selectGenres,
                onTap: () => homeController.setGenres(genres),
                );}),
            ),
          ),
          AppSpace.spaceH16,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text("${homeController.totalMovieList} ${homeController.selectGenres} Movies",style: Get.textTheme.displaySmall),),
          AppSpace.spaceH12,
          ListView.builder(
            itemCount: homeController.moviesListModel?.movies?.length ?? 0,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              Movie? movie = homeController.moviesListModel?.movies?[index];
              bool? filterMove = movie?.genres?.contains(homeController.selectGenres);

              return filterMove != null && filterMove ?  MovieListCard(movie: movie,): const SizedBox.shrink();
            },)
        ],
      ),
    );
  }
}