import 'package:bloc/bloc.dart';
import 'package:cubex_africa_flags_explorer/src/core/runner/failure.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_details_model.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/repository/african_flags_repository.dart';
import 'package:equatable/equatable.dart';

part 'country_details_event.dart';
part 'country_details_state.dart';

class CountryDetailsBloc extends Bloc<CountryDetailsEvent, CountryDetailsState> {
  final AfricanFlagsRepository repository;
  CountryDetailsBloc({required this.repository}) : super(CountryDetailsInitial()) {
    on<CountryDetailsEvent>((event, emit) async {
      if (event is FetchCountryDetails) {
        emit(CountryDetailsLoading());
        final countryDetails = await repository.getCountryDetailsByName(event.countryName);
        countryDetails.fold(
          (l) => emit(CountryDetailsFailure(l)),
          (r) => emit(CountryDetailsLoaded(countryDetails: r)),
        );
      }
    });
  }
}
