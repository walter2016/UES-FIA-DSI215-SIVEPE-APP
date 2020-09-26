import 'package:flutter/cupertino.dart';

enum UserState { available, away, busy }

class User {
  String id = UniqueKey().toString();
  String name;
  String email;
  String gender;
  DateTime dateOfBirth;
  String avatar;
  String address;
  UserState userState;

  User.init();

  User.basic(this.name, this.avatar, this.userState);

  User.advanced(this.name, this.email, this.gender, this.dateOfBirth,
      this.avatar, this.address, this.userState);

  User getCurrentUser() {
    return User.advanced(
        'Walter Alexander Quintanilla',
        'Wwalteralex1992@gmail.com',
        'H',
        DateTime(1993, 12, 31),
        'img/user2.jpg',
        '4600 Isaacs Creek Road Golden, IL 62339',
        UserState.available);
  }
}
