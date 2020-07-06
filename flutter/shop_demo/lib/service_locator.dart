import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'network/rest_client.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => RestClient(Dio()));
}
