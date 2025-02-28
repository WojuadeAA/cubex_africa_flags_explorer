part of 'country_details_bloc.dart';

sealed class CountryDetailsState extends Equatable {
  const CountryDetailsState();

  @override
  List<Object> get props => [];
}

final class CountryDetailsInitial extends CountryDetailsState {}

final class CountryDetailsLoading extends CountryDetailsState {}

final class CountryDetailsLoaded extends CountryDetailsState {
  final CountryDetails countryDetails;
  const CountryDetailsLoaded({required this.countryDetails});

  @override
  List<Object> get props => [countryDetails];
}

final class CountryDetailsFailure extends CountryDetailsState {
  final Failure failure;
  const CountryDetailsFailure(this.failure);

  @override
  List<Object> get props => [failure];
}
