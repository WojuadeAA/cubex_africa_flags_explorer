import 'package:cubex_africa_flags_explorer/src/core/runner/failure.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/models/country_model.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/repository/african_flags_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'african_flags_event.dart';
part 'african_flags_state.dart';

class AfricanFlagsBloc extends Bloc<AfricanFlagsEvent, AfricanFlagsState> {
  final AfricanFlagsRepository repository;

  AfricanFlagsBloc({required this.repository}) : super(AfricanFlagsInitial()) {
    on<AfricanFlagsEvent>((event, emit) async {
      if (event is FetchAfricanFlags) {
        emit(AfricanFlagsLoading());
        final countries = await repository.getCountries();

        countries.fold(
          (failure) => emit(AfricanFlagsFailure(failure)),
          (countries) => emit(AfricanFlagsLoaded(countries)),
        );
      }

      if (event is RefreshAfricanFlags) {
        emit(AfricanFlagsLoading());
        final countries = await repository.getCountries();

        countries.fold(
          (failure) => emit(AfricanFlagsFailure(failure)),
          (countries) => emit(AfricanFlagsLoaded(countries)),
        );
      }
    });
  }
}
