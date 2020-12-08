// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrollment_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EnrollmentEntity> _$enrollmentEntitySerializer =
    new _$EnrollmentEntitySerializer();

class _$EnrollmentEntitySerializer
    implements StructuredSerializer<EnrollmentEntity> {
  @override
  final Iterable<Type> types = const [EnrollmentEntity, _$EnrollmentEntity];
  @override
  final String wireName = 'EnrollmentEntity';

  @override
  Iterable<Object> serialize(Serializers serializers, EnrollmentEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.pagareUrl != null) {
      result
        ..add('pagareUrl')
        ..add(serializers.serialize(object.pagareUrl,
            specifiedType: const FullType(String)));
    }
    if (object.waterBillUrl != null) {
      result
        ..add('reciboAguaUrl')
        ..add(serializers.serialize(object.waterBillUrl,
            specifiedType: const FullType(String)));
    }
    if (object.energyBillUrl != null) {
      result
        ..add('reciboLuzUrl')
        ..add(serializers.serialize(object.energyBillUrl,
            specifiedType: const FullType(String)));
    }
    if (object.phoneBillUrl != null) {
      result
        ..add('reciboTelefonoUrl')
        ..add(serializers.serialize(object.phoneBillUrl,
            specifiedType: const FullType(String)));
    }
    if (object.bankReferenceUrl != null) {
      result
        ..add('referenciaBancariaUrl')
        ..add(serializers.serialize(object.bankReferenceUrl,
            specifiedType: const FullType(String)));
    }
    if (object.status != null) {
      result
        ..add('estado')
        ..add(serializers.serialize(object.status,
            specifiedType: const FullType(bool)));
    }
    if (object.date != null) {
      result
        ..add('fecha')
        ..add(serializers.serialize(object.date,
            specifiedType: const FullType(String)));
    }
    if (object.comment != null) {
      result
        ..add('comentario')
        ..add(serializers.serialize(object.comment,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  EnrollmentEntity deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EnrollmentEntityBuilder();

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
        case 'pagareUrl':
          result.pagareUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'reciboAguaUrl':
          result.waterBillUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'reciboLuzUrl':
          result.energyBillUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'reciboTelefonoUrl':
          result.phoneBillUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'referenciaBancariaUrl':
          result.bankReferenceUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'estado':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'fecha':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'comentario':
          result.comment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$EnrollmentEntity extends EnrollmentEntity {
  @override
  final int id;
  @override
  final String pagareUrl;
  @override
  final String waterBillUrl;
  @override
  final String energyBillUrl;
  @override
  final String phoneBillUrl;
  @override
  final String bankReferenceUrl;
  @override
  final bool status;
  @override
  final String date;
  @override
  final String comment;

  factory _$EnrollmentEntity(
          [void Function(EnrollmentEntityBuilder) updates]) =>
      (new EnrollmentEntityBuilder()..update(updates)).build();

  _$EnrollmentEntity._(
      {this.id,
      this.pagareUrl,
      this.waterBillUrl,
      this.energyBillUrl,
      this.phoneBillUrl,
      this.bankReferenceUrl,
      this.status,
      this.date,
      this.comment})
      : super._();

  @override
  EnrollmentEntity rebuild(void Function(EnrollmentEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EnrollmentEntityBuilder toBuilder() =>
      new EnrollmentEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnrollmentEntity &&
        id == other.id &&
        pagareUrl == other.pagareUrl &&
        waterBillUrl == other.waterBillUrl &&
        energyBillUrl == other.energyBillUrl &&
        phoneBillUrl == other.phoneBillUrl &&
        bankReferenceUrl == other.bankReferenceUrl &&
        status == other.status &&
        date == other.date &&
        comment == other.comment;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), pagareUrl.hashCode),
                                waterBillUrl.hashCode),
                            energyBillUrl.hashCode),
                        phoneBillUrl.hashCode),
                    bankReferenceUrl.hashCode),
                status.hashCode),
            date.hashCode),
        comment.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EnrollmentEntity')
          ..add('id', id)
          ..add('pagareUrl', pagareUrl)
          ..add('waterBillUrl', waterBillUrl)
          ..add('energyBillUrl', energyBillUrl)
          ..add('phoneBillUrl', phoneBillUrl)
          ..add('bankReferenceUrl', bankReferenceUrl)
          ..add('status', status)
          ..add('date', date)
          ..add('comment', comment))
        .toString();
  }
}

class EnrollmentEntityBuilder
    implements Builder<EnrollmentEntity, EnrollmentEntityBuilder> {
  _$EnrollmentEntity _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _pagareUrl;
  String get pagareUrl => _$this._pagareUrl;
  set pagareUrl(String pagareUrl) => _$this._pagareUrl = pagareUrl;

  String _waterBillUrl;
  String get waterBillUrl => _$this._waterBillUrl;
  set waterBillUrl(String waterBillUrl) => _$this._waterBillUrl = waterBillUrl;

  String _energyBillUrl;
  String get energyBillUrl => _$this._energyBillUrl;
  set energyBillUrl(String energyBillUrl) =>
      _$this._energyBillUrl = energyBillUrl;

  String _phoneBillUrl;
  String get phoneBillUrl => _$this._phoneBillUrl;
  set phoneBillUrl(String phoneBillUrl) => _$this._phoneBillUrl = phoneBillUrl;

  String _bankReferenceUrl;
  String get bankReferenceUrl => _$this._bankReferenceUrl;
  set bankReferenceUrl(String bankReferenceUrl) =>
      _$this._bankReferenceUrl = bankReferenceUrl;

  bool _status;
  bool get status => _$this._status;
  set status(bool status) => _$this._status = status;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _comment;
  String get comment => _$this._comment;
  set comment(String comment) => _$this._comment = comment;

  EnrollmentEntityBuilder();

  EnrollmentEntityBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _pagareUrl = _$v.pagareUrl;
      _waterBillUrl = _$v.waterBillUrl;
      _energyBillUrl = _$v.energyBillUrl;
      _phoneBillUrl = _$v.phoneBillUrl;
      _bankReferenceUrl = _$v.bankReferenceUrl;
      _status = _$v.status;
      _date = _$v.date;
      _comment = _$v.comment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnrollmentEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EnrollmentEntity;
  }

  @override
  void update(void Function(EnrollmentEntityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EnrollmentEntity build() {
    final _$result = _$v ??
        new _$EnrollmentEntity._(
            id: id,
            pagareUrl: pagareUrl,
            waterBillUrl: waterBillUrl,
            energyBillUrl: energyBillUrl,
            phoneBillUrl: phoneBillUrl,
            bankReferenceUrl: bankReferenceUrl,
            status: status,
            date: date,
            comment: comment);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
