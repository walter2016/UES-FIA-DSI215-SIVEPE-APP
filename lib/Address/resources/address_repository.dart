import 'package:com_app_tienda/Address/model/address.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

class AddressRepository {
  static Future<Database> _openDB() async {
    print('se creo');
    return openDatabase(join(await getDatabasesPath(), 'tienda.db'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE address (id INTEGER PRIMARY KEY,direccion TEXT,numeroCasa TEXT,municipio TEXT,departamento TEXT,referencia TEXT)");
    }, version: 1);
  }

  static Future<void> insertar(Address address) async {
    final Database database = await _openDB();

    return database.insert("address", address.toJson());
  }

  static Future<List<Address>> address() async {
    Database database = await _openDB();

    final List<Map<String, dynamic>> listaddress =
        await database.query("address");

    for (var n in listaddress) {
      print('__' + n['direccion']);
    }

    return List.generate(
        listaddress.length,
        (i) => Address(
            id: listaddress[i]['id'],
            direccion: listaddress[i]['direccion'],
            numeroCasa: listaddress[i]['numeroCasa'],
            municipio: listaddress[i]['municipio'],
            departamento: listaddress[i]['departamento'],
            referencia: listaddress[i]['referencia']));
  }

  static Future<void> delete(Address address) async {
    Database database = await _openDB();

    return database.delete("address", where: 'id = ?', whereArgs: [address.id]);
  }

  static Future<void> update(Address address) async {
    Database database = await _openDB();

    return database.update("address", address.toJson(),
        where: 'id = ?', whereArgs: [address.id]);
  }
}
