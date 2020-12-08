import 'package:com_app_tienda/Address/model/address.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

class AddressRepository {
  Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'tienda.db'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE address (id INTEGER PRIMARY KEY,direccion TEXT,numeroCasa TEXT,municipio TEXT,departamento TEXT,referencia TEXT)");
    }, version: 1);
  }

  Future<void> insertar(Address address) async {
    final Database database = await _openDB();

    return database.insert("address", address.toJson());
  }

  Future<List<Address>> address() async {
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
}
