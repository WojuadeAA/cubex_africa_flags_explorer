import 'package:cubex_africa_flags_explorer/src/features/african_flags/presentation/african_flags_bloc/african_flags_bloc.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/presentation/ui/widgets/african_flag_error_widget.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/presentation/ui/widgets/african_flag_loading_widget.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/presentation/ui/widgets/country_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({
    super.key,
  });

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AfricanFlagsBloc>().add(FetchAfricanFlags());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('African Flags Explorer'),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade900, Colors.lightBlue.shade200],
            ),
          ),
        ),
      ),
      body: BlocConsumer<AfricanFlagsBloc, AfricanFlagsState>(
        listener: (context, state) {
          if (state is AfricanFlagsFailure) {
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
            child: Center(child: _buildStateContent(state)),
          );
        },
      ),
    );
  }

  Widget _buildStateContent(AfricanFlagsState state) {
    if (state is AfricanFlagsFailure) {
      return AfricanFlagsErrorWidget(
        message: state.failure.message,
        onRetry: () => context.read<AfricanFlagsBloc>().add(FetchAfricanFlags()),
      );
    }

    if (state is AfricanFlagsLoaded) {
      return SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          children: state.countries.map((country) => CountryCardWidget(country: country)).toList(),
        ),
      );
    }
    return const LoadingWidget(message: "Loading African Flags...");
  }
}
