class Andress {
  final int id;
  final String direccion;
  final String numeroCasa;
  final String municipio;
  final String departamento;
  final String referencia;

  const Andress({
    this.id,
    this.direccion,
    this.numeroCasa,
    this.municipio,
    this.departamento,
    this.referencia,
  });
}

final direcciones = [
  new Andress(
    direccion: 'Colonia Guayacan, Pasaje Florida',
    numeroCasa: '54-2A',
    municipio: 'Soyapango',
    departamento: 'San Salvador',
    referencia: 'Primer Parqueo',
  ),
  new Andress(
    direccion: 'Colonia El Limon, Pasaje 10-B',
    numeroCasa: '54-2A',
    municipio: 'Soyapango',
    departamento: 'San Salvador',
    referencia: 'Primer Parqueo',
  ),
  new Andress(
    direccion: 'Colonia Monte Blanco, Pasaje 16',
    numeroCasa: '54-2A',
    municipio: 'Soyapango',
    departamento: 'San Salvador',
    referencia: 'Primer Parqueo',
  ),
  new Andress(
    direccion: 'Colonia San Jose, Calle 4',
    numeroCasa: '54-2A',
    municipio: 'Soyapango',
    departamento: 'San Salvador',
    referencia: 'Primer Parqueo',
  ),
];
