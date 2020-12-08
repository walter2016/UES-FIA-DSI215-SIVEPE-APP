// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_line_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderLineEntity> _$orderLineEntitySerializer =
    new _$OrderLineEntitySerializer();

class _$OrderLineEntitySerializer
    implements StructuredSerializer<OrderLineEntity> {
  @override
  final Iterable<Type> types = const [OrderLineEntity, _$OrderLineEntity];
  @override
  final String wireName = 'OrderLineEntity';

  @override
  Iterable<Object> serialize(Serializers serializers, OrderLineEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.productoId != null) {
      result
        ..add('productoId')
        ..add(serializers.serialize(object.productoId,
            specifiedType: const FullType(int)));
    }
    if (object.precioUnitario != null) {
      result
        ..add('precioUnitario')
        ..add(serializers.serialize(object.precioUnitario,
            specifiedType: const FullType(double)));
    }
    if (object.cantidad != null) {
      result
        ..add('cantidad')
        ..add(serializers.serialize(object.cantidad,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  OrderLineEntity deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderLineEntityBuilder();

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
        case 'productoId':
          result.productoId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'precioUnitario':
          result.precioUnitario = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'cantidad':
          result.cantidad = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$OrderLineEntity extends OrderLineEntity {
  @override
  final int id;
  @override
  final int productoId;
  @override
  final double precioUnitario;
  @override
  final int cantidad;

  factory _$OrderLineEntity([void Function(OrderLineEntityBuilder) updates]) =>
      (new OrderLineEntityBuilder()..update(updates)).build();

  _$OrderLineEntity._(
      {this.id, this.productoId, this.precioUnitario, this.cantidad})
      : super._();

  @override
  OrderLineEntity rebuild(void Function(OrderLineEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderLineEntityBuilder toBuilder() =>
      new OrderLineEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderLineEntity &&
        id == other.id &&
        productoId == other.productoId &&
        precioUnitario == other.precioUnitario &&
        cantidad == other.cantidad;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), productoId.hashCode),
            precioUnitario.hashCode),
        cantidad.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OrderLineEntity')
          ..add('id', id)
          ..add('productoId', productoId)
          ..add('precioUnitario', precioUnitario)
          ..add('cantidad', cantidad))
        .toString();
  }
}

class OrderLineEntityBuilder
    implements Builder<OrderLineEntity, OrderLineEntityBuilder> {
  _$OrderLineEntity _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  int _productoId;
  int get productoId => _$this._productoId;
  set productoId(int productoId) => _$this._productoId = productoId;

  double _precioUnitario;
  double get precioUnitario => _$this._precioUnitario;
  set precioUnitario(double precioUnitario) =>
      _$this._precioUnitario = precioUnitario;

  int _cantidad;
  int get cantidad => _$this._cantidad;
  set cantidad(int cantidad) => _$this._cantidad = cantidad;

  OrderLineEntityBuilder();

  OrderLineEntityBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _productoId = _$v.productoId;
      _precioUnitario = _$v.precioUnitario;
      _cantidad = _$v.cantidad;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderLineEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$OrderLineEntity;
  }

  @override
  void update(void Function(OrderLineEntityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OrderLineEntity build() {
    final _$result = _$v ??
        new _$OrderLineEntity._(
            id: id,
            productoId: productoId,
            precioUnitario: precioUnitario,
            cantidad: cantidad);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
