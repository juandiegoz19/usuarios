import 'dart:convert';

import 'package:usuarios/domain/home/model/Address.dart';
import 'package:usuarios/domain/home/model/Company.dart';
import 'package:usuarios/domain/home/model/Geo.dart';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x, false)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  get getId => id ?? '';
  get getName => name ?? '';
  get getUsername => username ?? '';
  get getEmail => email ?? '';
  get getAddress => address ?? '';
  get getPhone => phone ?? '';
  get getWebSite => website ?? '';
  get getCompany => company ?? '';

  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  factory User.fromJson(Map<dynamic, dynamic> json, bool bdUsed) => User(
        id: json["id"],
        name: json["name"],
        username: bdUsed ? json["username"] : json["username"],
        email: json["email"],
        address: bdUsed
            ? Address(
                city: json['city'],
                street: json['street'],
                suite: json['suite'],
                zipcode: json['zipcode'],
                geo: Geo(lat: json['lat'], lng: json['lng']))
            : Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: bdUsed
            ? Company(
                bs: json['bs'],
                catchPhrase: json['catchPhrase'],
                name: json['nameCompany'])
            : Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address?.toJson(),
        "phone": phone,
        "website": website,
        "company": company?.toJson(),
      };

  Map<String, dynamic> toJsonInsert() => {
        "id": id,
        "nameC": name,
        "username": username,
        "email": email,
        "phone": phone,
        "website": website,
      };

  Map<String, dynamic> toJsonAddressInsert() => {
        "userId": id,
        "street": address?.getStreet,
        "suite": address?.getSuite,
        "city": address?.getCity,
        "zipcode": address?.getZipCode,
        "lat": address?.geo?.getLat,
        "lng": address?.geo?.getLng,
      };

  Map<String, dynamic> toJsonCompanyInsert() => {
        "userId": id,
        "name": company?.getName,
        "catchPhrase": company?.getCatchPhrase,
        "bs": company?.getBs,
      };
}
