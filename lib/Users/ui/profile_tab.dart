import 'package:com_app_tienda/Users/blocs/authentication_bloc.dart';
import 'package:com_app_tienda/Users/blocs/authentication_event.dart';
import 'package:com_app_tienda/Users/blocs/authentication_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  AuthenticationBloc authenticationBloc;

  @override
  void initState() {
    super.initState();
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (BuildContext context, AuthenticationState state) {
        String email = "";
        if (state is Authenticated) {
          email = state.user.email;
        }
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (BuildContext context, AuthenticationState state){
            if (state is Unauthenticated) {
              Navigator.pushReplacementNamed(context, '/login');
            }
          },
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: [
              Text("Email: $email"),
              RaisedButton(
                onPressed: () {
                  authenticationBloc.add(LoggedOut());
                },
                child: Text("Cerrar sesión"),
              ),
            ],
          ),
        );
      },
    );
  }
}
