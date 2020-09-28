import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';
import '../models/user_entity.dart';
import '../resources/user_repository.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>{
  final UserRepository userRepository;
  AuthenticationBloc({@required this.userRepository}) : super(Uninitialized());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if(event is AppStarted){
      yield* _mapAppStartedToState();
    } 
    else if (event is LoginRequest) {
      yield* _mapLoginRequestToState(event);
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut){
      yield* _mapLoggedOutToState();
    } else if(event is UpdateUserProfile) {
      yield* _mapUpdateUserProfileToState(event);
    } else if (event is RegisterUserWithEmail) {
      yield* _mapRegisterUserWithEmailToState(event);
    } else if (event is LoginError) {
      yield* _mapLoginErrorToState(event);
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState()async* {
    try{
      final isSignedIn = userRepository.isSignedIn();
      if(isSignedIn){
        final user = (await userRepository.getUser());
        yield Authenticated(user);
      }else{
        yield Unauthenticated("");
      }
    }catch(_){
      yield Unauthenticated("Could not verify user credentials");
    }
  }

  Stream<AuthenticationState> _mapLoginRequestToState(LoginRequest event) async* {
    try{
      await userRepository.signInWithCredentials(event.email, event.password);
      add(LoggedIn());
    } on FirebaseAuthException catch(e) {
     add(LoginError(e.message));
    } on Exception catch(e) {
      add(LoginError(e.toString()));
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async*{
    final UserEntity user = await userRepository.getUser();
    yield Authenticated(user);
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield Unauthenticated("Loging out");
    userRepository.signOut();
  }

  Stream<AuthenticationState> _mapUpdateUserProfileToState(UpdateUserProfile event) async* {
    await userRepository.updateUserProfile(name: event.name, photoURL: event.photoURL);
    yield Authenticated(await userRepository.getUser());
  }

  Stream<AuthenticationState> _mapRegisterUserWithEmailToState(RegisterUserWithEmail event) async* {
    try{
      await userRepository.signUp(email: event.email, password: event.password);
      await userRepository.updateUserProfile(name: event.name);
      UserEntity user = await userRepository.getUser();
      yield Authenticated(user);
    } on FirebaseAuthException catch(e) {
      add(LoginError(e.message));
    } on Exception catch(e) {
      add(LoginError(e.toString()));
    }
  }

  Stream<AuthenticationState> _mapLoginErrorToState(LoginError event) async* {
    yield Unauthenticated(event.message);
  }
}
