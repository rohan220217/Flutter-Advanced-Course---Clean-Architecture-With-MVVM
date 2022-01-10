import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:msa_internship/app/app_pref.dart';
import 'package:msa_internship/data/data_source/remote_data_source.dart';
import 'package:msa_internship/data/network/app_api.dart';
import 'package:msa_internship/data/network/dio_facotry.dart';
import 'package:msa_internship/data/network/network_info.dart';
import 'package:msa_internship/data/repository/repository_imp.dart';
import 'package:msa_internship/domain/repository/repository.dart';
import 'package:msa_internship/domain/usecase/login_usecase.dart';
import 'package:msa_internship/presentation/login/login_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_pref.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  // shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  // instance.registerLazySingleton<NetworkInfo>(
  //     () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // app  service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementer(instance()));

  // repository
  instance.registerLazySingleton<Repository>(
      // () => RepositoryImpl(instance(), instance()));
      () => RepositoryImpl(instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}
