// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CategoryEntity> _$categoryEntitySerializer =
    new _$CategoryEntitySerializer();

class _$CategoryEntitySerializer
    implements StructuredSerializer<CategoryEntity> {
  @override
  final Iterable<Type> types = const [CategoryEntity, _$CategoryEntity];
  @override
  final String wireName = 'CategoryEntity';

  @override
  Iterable<Object> serialize(Serializers serializers, CategoryEntity object,
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
    if (object.idPadre != null) {
      result
        ..add('idPadre')
        ..add(serializers.serialize(object.idPadre,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  CategoryEntity deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoryEntityBuilder();

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
        case 'idPadre':
          result.idPadre = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$CategoryEntity extends CategoryEntity {
  @override
  final int id;
  @override
  final String nombre;
  @override
  final int idPadre;

  factory _$CategoryEntity([void Function(CategoryEntityBuilder) updates]) =>
      (new CategoryEntityBuilder()..update(updates)).build();

  _$CategoryEntity._({this.id, this.nombre, this.idPadre}) : super._();

  @override
  CategoryEntity rebuild(void Function(CategoryEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryEntityBuilder toBuilder() =>
      new CategoryEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoryEntity &&
        id == other.id &&
        nombre == other.nombre &&
        idPadre == other.idPadre;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, id.hashCode), nombre.hashCode), idPadre.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CategoryEntity')
          ..add('id', id)
          ..add('nombre', nombre)
          ..add('idPadre', idPadre))
        .toString();
  }
}

class CategoryEntityBuilder
    implements Builder<CategoryEntity, CategoryEntityBuilder> {
  _$CategoryEntity _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _nombre;
  String get nombre => _$this._nombre;
  set nombre(String nombre) => _$this._nombre = nombre;

  int _idPadre;
  int get idPadre => _$this._idPadre;
  set idPadre(int idPadre) => _$this._idPadre = idPadre;

  CategoryEntityBuilder();

  CategoryEntityBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _nombre = _$v.nombre;
      _idPadre = _$v.idPadre;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoryEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CategoryEntity;
  }

  @override
  void update(void Function(CategoryEntityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CategoryEntity build() {
    final _$result =
        _$v ?? new _$CategoryEntity._(id: id, nombre: nombre, idPadre: idPadre);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
