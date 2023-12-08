import 'package:get_it/get_it.dart';
import 'package:my_bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:my_bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(ApiService(Dio())));
}
