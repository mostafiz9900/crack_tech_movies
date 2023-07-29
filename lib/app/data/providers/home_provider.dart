
import 'package:get/get.dart';

import '../../app_pkg.dart';
import 'base_provider.dart';

class HomeProvider extends BaseProvider{

  Future<Response> getMovieList() {
    return get(ApiConstants.movieList);
  }

}