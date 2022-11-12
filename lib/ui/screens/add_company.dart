import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/company_cubit.dart';
import '../../models/address.dart';
import '../../models/company.dart';

class AddCompany extends StatelessWidget {
  AddCompany({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  Address? address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nouvelle entreprise'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Le champ ne doit pas être vide';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  prefixIcon: Icon(Icons.apartment),
                  labelText: "Nom de l'entreprise",
                ),
              ),
              
              const SizedBox(
                height: 16,
              ),
              
              TextFormField(
                controller: _addressController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Le champ ne doit pas être vide';
                  }
                  return null;
                },
                readOnly: true,
                onTap: () async {
                  address = await Navigator.of(context)
                      .pushNamed('/searchAddress') as Address?;
                  if (address != null) {
                    _addressController.text =
                        '${address!.street}, ${address!.postcode} ${address!.city}';
                  }

                  Navigator.of(context)
                      .pushNamed<Address?>('/searchAddress')
                      .then((value) {
                    if (value != null) {
                      address = value;
                      _addressController.text =
                          '${address!.street}, ${address!.postcode} ${address!.city}';
                    }
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  prefixIcon: Icon(Icons.apartment),
                  labelText: "Adresse de l'entreprise",
                ),
              ),
              
              const SizedBox(
                height: 16,
              ),
              
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && address != null) {
                      final String name = _addressController.text;
                      final Company company = Company(0, name, address!);
                      context.read<CompanyCubit>().addCompany(company);
                      Navigator.of(context).pop();
                    }
                  },

                  child: const Text('Valider'))
            ],
          ),
        ),
      ),
    );
  }
}