import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mds_2022_tp/blocs/company_cubit.dart';
import 'package:mds_2022_tp/repositories/preferences_repository.dart';
import 'package:mds_2022_tp/ui/screens/add_company.dart';
import 'package:mds_2022_tp/ui/screens/home.dart';
import 'package:mds_2022_tp/ui/screens/search_address.dart';

final CompanyCubit companyCubit = CompanyCubit(PreferencesRepository());

void main() {
  // Pour pouvoir utiliser les SharePreferences avant le runApp
  WidgetsFlutterBinding.ensureInitialized();
  
  // Instanciation du Cubit
  final CompanyCubit companyCubit = CompanyCubit(PreferencesRepository());
  
  // Chargement des entreprises
  companyCubit.loadCompanies();

  runApp(
      BlocProvider<CompanyCubit>(
        create: (_) => companyCubit,
        child: const MyApp(),
      )
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Entrep',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/addCompany': (context) => AddCompany(),
        '/searchAddress': (context) => SearchAddress()
      },
      
    );
  }
}
