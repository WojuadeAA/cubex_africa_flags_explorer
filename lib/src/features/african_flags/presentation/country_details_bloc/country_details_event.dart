part of 'country_details_bloc.dart';

sealed class CountryDetailsEvent extends Equatable {
  const CountryDetailsEvent();

  @override
  List<Object> get props => [];
}

final class FetchCountryDetails extends CountryDetailsEvent {
  final String countryName;
  const FetchCountryDetails({required this.countryName});

  @override
  List<Object> get props => [countryName];
}
