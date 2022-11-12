import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mds_2022_tp/blocs/company_cubit.dart';
import 'package:mds_2022_tp/models/address.dart';

import '../../models/company.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
      
      return Container (
      decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(255, 132, 180, 217), Color.fromARGB(255, 73, 137, 166), Color.fromARGB(255, 33, 48, 210)])
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 33, 48, 210),
          title: const Text('Listes des entreprises'),
        ),
        body: BlocBuilder<CompanyCubit, List<Company>>(
          builder: (context, companies) {
            
            return ListView.builder(
              itemCount: companies.length,
              itemBuilder: (BuildContext context, int index) {
                final Company company = companies[index];
                
                return Card(
                  margin: const EdgeInsets.all(5.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  
                  child: ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.apartment),
                    title: Text(company.name),
                    subtitle: Text(
                        '${company.address!.street}, ${company.address!.postcode}, ${company.address!.city} '),
                  ),
                );
              },
            );
          },
        ),
        
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            
            Navigator.of(context).pushNamed('/addCompany');
          },
          child: const Icon(Icons.add),
        ),
      ),
      );
    }
}
