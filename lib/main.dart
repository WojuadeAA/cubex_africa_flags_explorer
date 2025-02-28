import 'package:cubex_africa_flags_explorer/src/core/locator.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/data/repository/african_flags_repository.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/presentation/african_flags_bloc/african_flags_bloc.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/presentation/country_details_bloc/country_details_bloc.dart';
import 'package:cubex_africa_flags_explorer/src/features/african_flags/presentation/ui/screens/african_countries_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AfricanFlagsBloc>(
          create: (context) => AfricanFlagsBloc(repository: getIt<AfricanFlagsRepositoryImpl>()),
        ),
        BlocProvider(
          create: (context) => CountryDetailsBloc(repository: getIt<AfricanFlagsRepositoryImpl>()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CountriesScreen(),
      ),
    );
  }
}
