// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderEntity> _$orderEntitySerializer = new _$OrderEntitySerializer();

class _$OrderEntitySerializer implements StructuredSerializer<OrderEntity> {
  @override
  final Iterable<Type> types = const [OrderEntity, _$OrderEntity];
  @override
  final String wireName = 'OrderEntity';

  @override
  Iterable<Object> serialize(Serializers serializers, OrderEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.estado != null) {
      result
        ..add('estado')
        ..add(serializers.serialize(object.estado,
            specifiedType: const FullType(String)));
    }
    if (object.fecha != null) {
      result
        ..add('fecha')
        ..add(serializers.serialize(object.fecha,
            specifiedType: const FullType(String)));
    }
    if (object.usuarioId != null) {
      result
        ..add('usuarioId')
        ..add(serializers.serialize(object.usuarioId,
            specifiedType: const FullType(String)));
    }
    if (object.lineaDeOrden != null) {
      result
        ..add('lineaDeOrden')
        ..add(serializers.serialize(object.lineaDeOrden,
            specifiedType: const FullType(
                BuiltList, const [const FullType(OrderLineEntity)])));
    }
    return result;
  }

  @override
  OrderEntity deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderEntityBuilder();

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
        case 'estado':
          result.estado = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fecha':
          result.fecha = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'usuarioId':
          result.usuarioId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lineaDeOrden':
          result.lineaDeOrden.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(OrderLineEntity)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$OrderEntity extends OrderEntity {
  @override
  final int id;
  @override
  final String estado;
  @override
  final String fecha;
  @override
  final String usuarioId;
  @override
  final BuiltList<OrderLineEntity> lineaDeOrden;

  factory _$OrderEntity([void Function(OrderEntityBuilder) updates]) =>
      (new OrderEntityBuilder()..update(updates)).build();

  _$OrderEntity._(
      {this.id, this.estado, this.fecha, this.usuarioId, this.lineaDeOrden})
      : super._();

  @override
  OrderEntity rebuild(void Function(OrderEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderEntityBuilder toBuilder() => new OrderEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderEntity &&
        id == other.id &&
        estado == other.estado &&
        fecha == other.fecha &&
        usuarioId == other.usuarioId &&
        lineaDeOrden == other.lineaDeOrden;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), estado.hashCode), fecha.hashCode),
            usuarioId.hashCode),
        lineaDeOrden.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OrderEntity')
          ..add('id', id)
          ..add('estado', estado)
          ..add('fecha', fecha)
          ..add('usuarioId', usuarioId)
          ..add('lineaDeOrden', lineaDeOrden))
        .toString();
  }
}

class OrderEntityBuilder implements Builder<OrderEntity, OrderEntityBuilder> {
  _$OrderEntity _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _estado;
  String get estado => _$this._estado;
  set estado(String estado) => _$this._estado = estado;

  String _fecha;
  String get fecha => _$this._fecha;
  set fecha(String fecha) => _$this._fecha = fecha;

  String _usuarioId;
  String get usuarioId => _$this._usuarioId;
  set usuarioId(String usuarioId) => _$this._usuarioId = usuarioId;

  ListBuilder<OrderLineEntity> _lineaDeOrden;
  ListBuilder<OrderLineEntity> get lineaDeOrden =>
      _$this._lineaDeOrden ??= new ListBuilder<OrderLineEntity>();
  set lineaDeOrden(ListBuilder<OrderLineEntity> lineaDeOrden) =>
      _$this._lineaDeOrden = lineaDeOrden;

  OrderEntityBuilder();

  OrderEntityBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _estado = _$v.estado;
      _fecha = _$v.fecha;
      _usuarioId = _$v.usuarioId;
      _lineaDeOrden = _$v.lineaDeOrden?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$OrderEntity;
  }

  @override
  void update(void Function(OrderEntityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OrderEntity build() {
    _$OrderEntity _$result;
    try {
      _$result = _$v ??
          new _$OrderEntity._(
              id: id,
              estado: estado,
              fecha: fecha,
              usuarioId: usuarioId,
              lineaDeOrden: _lineaDeOrden?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'lineaDeOrden';
        _lineaDeOrden?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'OrderEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
