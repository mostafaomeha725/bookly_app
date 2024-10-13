import 'package:booklyapp1/core/Services/ApiServices.dart';
import 'package:booklyapp1/core/home/repo/homerepoImpl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      apiServices: getIt.get<ApiServices>(),
    ),
  );
}
