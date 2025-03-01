import 'package:cubex_africa_flags_explorer/src/features/african_flags/presentation/country_details_bloc/country_details_bloc.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/presentation/ui/widgets/african_flag_error_widget.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/presentation/ui/widgets/african_flag_loading_widget.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/presentation/ui/widgets/country_details_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryDetailsScreen extends StatefulWidget {
  const CountryDetailsScreen({super.key, required this.countryName});
  final String countryName;

  @override
  State<CountryDetailsScreen> createState() => _CountryDetailsScreenState();
}

class _CountryDetailsScreenState extends State<CountryDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CountryDetailsBloc>().add(FetchCountryDetails(countryName: widget.countryName));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountryDetailsBloc, CountryDetailsState>(
      listener: (context, state) {
        if (state is CountryDetailsFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.failure.message),
            ),
          );
        }
      },
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: _buildStateContent(state),
        );
      },
    );
  }

  _buildStateContent(CountryDetailsState state) {
    if (state is CountryDetailsFailure) {
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.countryName),
            automaticallyImplyLeading: true,
          ),
          body: AfricanFlagsErrorWidget(
            message: state.failure.message,
            onRetry: () {
              context.read<CountryDetailsBloc>().add(FetchCountryDetails(countryName: widget.countryName));
            },
          ));
    }
    if (state is CountryDetailsLoaded) {
      return CountryDetailsContent(country: state.countryDetails);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.countryName),
        automaticallyImplyLeading: true,
      ),
      body: LoadingWidget(
        message: 'Loading ${widget.countryName} details...',
      ),
    );
  }
}
