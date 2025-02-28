// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cubex_africa_flags_explorer/src/core/runner/failure.dart';
import 'package:cubex_africa_flags_explorer/src/core/runner/service_runner.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/datasource/remote_service.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_model.dart';

abstract class AfricanFlagsRepository {
  FutureEither<List<Country>> getCountries();
}

class AfricanFlagsRepositoryImpl implements AfricanFlagsRepository {
  final AfricanFlagsRemoteService remoteService;
  AfricanFlagsRepositoryImpl({required this.remoteService});
  final String name = '$AfricanFlagsRepositoryImpl';

  @override
  FutureEither<List<Country>> getCountries() {
    try {
      return ServiceRunner<Failure, List<Country>>().run(
        name: name,
        call: remoteService.getCountries(),
      );
    } catch (e) {
      return FutureEither.error(const CommonFailure('An error occurred', ""));
    }
  }
}
