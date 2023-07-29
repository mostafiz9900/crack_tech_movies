import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:movie_online/app/app_pkg.dart';

import '../../../data/providers/home_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart' as connectivity;

class HomeController extends GetxController {
  final HomeProvider homeProvider;
  HomeController({required this.homeProvider});

  MoviesListModel? moviesListModel;
  List<String>? genres = [];
  bool isPageLoading = false;
  String? selectGenres;
  int totalMovieList = 0;


  @override
  void onInit() {
    getMovieList();
    super.onInit();
  }

  setGenres(String? genres){
    selectGenres = genres ;
    totalMovieList = 0;
    moviesListModel?.movies?.forEach((element) {
      if(element.genres!.contains(selectGenres)){totalMovieList ++;}
    });
    update();
  }

  Future<void> getMovieList () async{
    isPageLoading = true;
    update();
    Fluttertoast.showToast(msg: "Open Movie List");
    if(await checkInternetConnection()){
      Response<dynamic>? response = await homeProvider.getMovieList();
      if(response.statusCode == 200){
        moviesListModel = moviesListModelFromJson(response.body);
        selectGenres = moviesListModel?.genres?.first;
        setGenres(moviesListModel?.genres?.first);
        Fluttertoast.showToast(msg: response.statusCode.toString());
        isPageLoading = false;
      } else {
        Fluttertoast.showToast(msg: response.statusCode.toString());
        Fluttertoast.showToast(msg: response.body.toString());
        isPageLoading = false;
        print("Summing Was Worn");
      }
    } else {
      Fluttertoast.showToast(msg: "No Internet Connection");
      Helpers.miniErrorSnackBarFor(massage: "No Internet Connection");
      isPageLoading = false;
    }
    update();
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
