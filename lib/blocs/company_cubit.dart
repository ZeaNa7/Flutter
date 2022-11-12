import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/address.dart';
import '../models/company.dart';
import '../repositories/preferences_repository.dart';


/// Déclaration d'un "Cubit" pour stocker la liste d'entreprise
class CompanyCubit extends Cubit<List<Company>> {

  final PreferencesRepository preferencesRepository;

  /// Constructeur + initialisation du Cubit avec un tableau vide d'entreprise
  CompanyCubit(this.preferencesRepository) : super([]);


  /// Méthode pour charger la liste d'entreprise
  Future<void> loadCompanies() async {
    emit([
      const Company(0, 'Entreprise 1', Address('street', 'city', 'postcode')),
      const Company(1, 'Entreprise 2', Address('street', 'city', 'postcode')),
      const Company(2, 'Entreprise 3', Address('street', 'city', 'postcode')),
    ]);
  }

  /// Méthode pour ajouter une entreprise 
  void addCompany(Company company) {
    emit([...state, company]);
  }
}
