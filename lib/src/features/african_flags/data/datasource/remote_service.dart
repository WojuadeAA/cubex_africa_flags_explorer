import 'package:cubex_africa_flags_explorer/src/core/constants/endpoints.dart';
import 'package:cubex_africa_flags_explorer/src/core/network/network_service.dart';
import 'package:cubex_africa_flags_explorer/src/core/network/response_processor.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_model.dart';

abstract class AfricanFlagsRemoteService {
  Future<List<Country>> getCountries();
}

class AfricanFlagsRemoteServiceImpl implements AfricanFlagsRemoteService {
  AfricanFlagsRemoteServiceImpl({required this.httpService});
  final HttpService httpService;
  @override
  Future<List<Country>> getCountries() async {
    final response = await httpService.get(Endpoints.africanCountries);

    return processResponse<List<Country>>(
      response: response,
      serializer: (data) {
        final rawCountries = data as List;
        return rawCountries.map((e) => Country.fromJson(e as Map<String, dynamic>)).toList();
      },
    );
  }
}
