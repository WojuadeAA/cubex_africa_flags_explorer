part of 'african_flags_bloc.dart';

sealed class AfricanFlagsEvent extends Equatable {
  const AfricanFlagsEvent();

  @override
  List<Object> get props => [];
}

final class FetchAfricanFlags extends AfricanFlagsEvent {}

final class RefreshAfricanFlags extends AfricanFlagsEvent {}
