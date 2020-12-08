import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
  Address({
    this.id,
    this.direccion,
    this.numeroCasa,
    this.municipio,
    this.departamento,
    this.referencia,
  });

  int id;
  String direccion;
  String numeroCasa;
  String municipio;
  String departamento;
  String referencia;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        direccion: json["direccion"],
        numeroCasa: json["numeroCasa"],
        municipio: json["municipio"],
        departamento: json["departamento"],
        referencia: json["referencia"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "direccion": direccion,
        "numeroCasa": numeroCasa,
        "municipio": municipio,
        "departamento": departamento,
        "referencia": referencia,
      };
}
