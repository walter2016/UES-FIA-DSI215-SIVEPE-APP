import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'user_entity.g.dart';

abstract class UserEntity implements Built<UserEntity, UserEntityBuilder> {
  factory UserEntity([void updates(UserEntityBuilder b)]) = _$UserEntity;

  UserEntity._();

  @nullable
  String get uid;

  @nullable
  String get email;

  @nullable
  String get displayName;

  @nullable
  String get photoURL;

  @nullable
  BuiltMap<String, Object> get claims;

  static Serializer<UserEntity> get serializer => _$userEntitySerializer;
}
