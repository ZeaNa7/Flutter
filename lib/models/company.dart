import 'address.dart';

class Company {
  final int id;
  final String name;
  final Address address;

  const Company(this.id, this.name, this.address);

  Map<String, dynamic> toJson() {
  return {
    'id': id,
    'name': name,
    'address': address,
  };
}
factory Company.fromJson(Map<String, dynamic> json) {
  return Company(
      json['id'],
      json['name'],
      json['address']
  );
}

}
