import 'package:built_collection/built_collection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {

  final FirebaseAuth _firebaseAuth;
  UserRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<UserEntity> fromFirebaseUserToUserEntity(User user) async {
    final UserEntity userEntity = UserEntity();

    final claims = (await user.getIdTokenResult()).claims;
    return userEntity.rebuild((b) => b
      ..uid = user.uid
      ..displayName = user.displayName
      ..email = user.email
      ..photoURL = user.photoURL
      ..claims.replace(BuiltMap<String, Object>(claims))
    );
  }

  Future<void> signInWithCredentials(String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password
    );
  }

  Future<void> signUp({String email, String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
    ]);
  }

  Future<UserEntity> getUser() async {
    final User user = _firebaseAuth.currentUser;
    return await fromFirebaseUserToUserEntity(user);
  }

  Future<void> updateUserProfile({String name, String photoURL}) async {
    final User user = _firebaseAuth.currentUser;
    if (photoURL != null) {
      return await user.updateProfile(displayName: name, photoURL: photoURL);
    } 
    return await user.updateProfile(displayName: name);
  }

  bool isSignedIn() {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

}
