import 'package:flutter/material.dart';

import '../../models/address.dart';
import '../../repositories/address_repository.dart';

class SearchAddress extends StatefulWidget {
  const SearchAddress({Key? key}) : super(key: key);

  @override
  State<SearchAddress> createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {
  List<Address> _addresses = [
    Address('Place du Ralliement', 'Angers', '49000'),
    Address('19 rue André le Notre', 'Angers', '49066'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recherche adresse'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) async {
              if (value.length >= 3) {
                final AddressRepository addressRepository = AddressRepository();
                // Méthode 1
                List<Address> addresses =
                    await addressRepository.fetchAddresses(value);
                setState(() {
                  _addresses = addresses;
                });

                // Méthode 2
                // addressRepository.fetchAddresses(value).then((addresses) {
                //   setState(() {
                //     _addresses = addresses;
                //   });
                // });
              }
              print(value);
            },
          ),
          Expanded(
            child: ListView.separated(
              itemCount: _addresses.length,
              itemBuilder: (context, index) {
                final Address address = _addresses[index];
                return ListTile(
                  title: Text(address.street),
                  subtitle: Text('${address.postcode} ${address.city}'),
                  onTap: () {
                    Navigator.of(context).pop(address);
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(height: 0);
              },
            ),
          )
        ],
      ),
    );
  }
}