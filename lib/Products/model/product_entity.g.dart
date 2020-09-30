// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductEntity> _$productEntitySerializer =
    new _$ProductEntitySerializer();

class _$ProductEntitySerializer implements StructuredSerializer<ProductEntity> {
  @override
  final Iterable<Type> types = const [ProductEntity, _$ProductEntity];
  @override
  final String wireName = 'ProductEntity';

  @override
  Iterable<Object> serialize(Serializers serializers, ProductEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.nombre != null) {
      result
        ..add('nombre')
        ..add(serializers.serialize(object.nombre,
            specifiedType: const FullType(String)));
    }
    if (object.precio != null) {
      result
        ..add('precio')
        ..add(serializers.serialize(object.precio,
            specifiedType: const FullType(double)));
    }
    if (object.imagenUrl != null) {
      result
        ..add('imagenUrl')
        ..add(serializers.serialize(object.imagenUrl,
            specifiedType: const FullType(String)));
    }
    if (object.idCategoria != null) {
      result
        ..add('idCategoria')
        ..add(serializers.serialize(object.idCategoria,
            specifiedType: const FullType(int)));
    }
    if (object.idPerfil != null) {
      result
        ..add('idPerfil')
        ..add(serializers.serialize(object.idPerfil,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  ProductEntity deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'nombre':
          result.nombre = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'precio':
          result.precio = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'imagenUrl':
          result.imagenUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'idCategoria':
          result.idCategoria = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'idPerfil':
          result.idPerfil = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ProductEntity extends ProductEntity {
  @override
  final int id;
  @override
  final String nombre;
  @override
  final double precio;
  @override
  final String imagenUrl;
  @override
  final int idCategoria;
  @override
  final int idPerfil;

  factory _$ProductEntity([void Function(ProductEntityBuilder) updates]) =>
      (new ProductEntityBuilder()..update(updates)).build();

  _$ProductEntity._(
      {this.id,
      this.nombre,
      this.precio,
      this.imagenUrl,
      this.idCategoria,
      this.idPerfil})
      : super._();

  @override
  ProductEntity rebuild(void Function(ProductEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductEntityBuilder toBuilder() => new ProductEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductEntity &&
        id == other.id &&
        nombre == other.nombre &&
        precio == other.precio &&
        imagenUrl == other.imagenUrl &&
        idCategoria == other.idCategoria &&
        idPerfil == other.idPerfil;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), nombre.hashCode), precio.hashCode),
                imagenUrl.hashCode),
            idCategoria.hashCode),
        idPerfil.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProductEntity')
          ..add('id', id)
          ..add('nombre', nombre)
          ..add('precio', precio)
          ..add('imagenUrl', imagenUrl)
          ..add('idCategoria', idCategoria)
          ..add('idPerfil', idPerfil))
        .toString();
  }
}

class ProductEntityBuilder
    implements Builder<ProductEntity, ProductEntityBuilder> {
  _$ProductEntity _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _nombre;
  String get nombre => _$this._nombre;
  set nombre(String nombre) => _$this._nombre = nombre;

  double _precio;
  double get precio => _$this._precio;
  set precio(double precio) => _$this._precio = precio;

  String _imagenUrl;
  String get imagenUrl => _$this._imagenUrl;
  set imagenUrl(String imagenUrl) => _$this._imagenUrl = imagenUrl;

  int _idCategoria;
  int get idCategoria => _$this._idCategoria;
  set idCategoria(int idCategoria) => _$this._idCategoria = idCategoria;

  int _idPerfil;
  int get idPerfil => _$this._idPerfil;
  set idPerfil(int idPerfil) => _$this._idPerfil = idPerfil;

  ProductEntityBuilder();

  ProductEntityBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _nombre = _$v.nombre;
      _precio = _$v.precio;
      _imagenUrl = _$v.imagenUrl;
      _idCategoria = _$v.idCategoria;
      _idPerfil = _$v.idPerfil;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProductEntity;
  }

  @override
  void update(void Function(ProductEntityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProductEntity build() {
    final _$result = _$v ??
        new _$ProductEntity._(
            id: id,
            nombre: nombre,
            precio: precio,
            imagenUrl: imagenUrl,
            idCategoria: idCategoria,
            idPerfil: idPerfil);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
