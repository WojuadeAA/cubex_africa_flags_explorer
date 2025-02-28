part of 'african_flags_bloc.dart';

sealed class AfricanFlagsState extends Equatable {
  const AfricanFlagsState();

  @override
  List<Object> get props => [];
}

final class AfricanFlagsInitial extends AfricanFlagsState {}

final class AfricanFlagsLoading extends AfricanFlagsState {}

final class AfricanFlagsLoaded extends AfricanFlagsState {
  final List<Country> countries;

  const AfricanFlagsLoaded(this.countries);

  @override
  List<Object> get props => [countries];
}

final class AfricanFlagsFailure extends AfricanFlagsState {
  final Failure failure;

  const AfricanFlagsFailure(this.failure);

  @override
  List<Object> get props => [failure];
}
