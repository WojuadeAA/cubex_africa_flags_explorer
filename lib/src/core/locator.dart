import 'package:cubex_africa_flags_explorer/src/core/constants/constants.dart';
import 'package:cubex_africa_flags_explorer/src/core/network/network_service.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/datasource/remote_service.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/repository/african_flags_repository.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => IHttpService(baseUrl: Constants.baseUrl));
  getIt.registerLazySingleton(
      () => AfricanFlagsRemoteServiceImpl(httpService: getIt<IHttpService>()));
  getIt.registerLazySingleton(() => AfricanFlagsRepositoryImpl(
      remoteService: getIt<AfricanFlagsRemoteServiceImpl>()));
}
