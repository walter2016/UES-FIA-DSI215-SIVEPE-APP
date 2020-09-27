import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.id,
    this.imagenUrl,
    this.nombre,
    this.precio,
    this.estado,
  });

  int id;
  String imagenUrl;
  String nombre;
  int precio;
  String estado;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        imagenUrl: json["imagenUrl"],
        nombre: json["nombre"],
        precio: json["precio"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imagenUrl": imagenUrl,
        "nombre": nombre,
        "precio": precio,
        "estado": estado,
      };
}
