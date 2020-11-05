import 'package:com_app_tienda/Users/blocs/authentication_bloc.dart';
import 'package:com_app_tienda/Users/blocs/authentication_state.dart';
import 'package:com_app_tienda/Users/models/user_entity.dart';
import 'package:com_app_tienda/models/user.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileSettingsDialog extends StatefulWidget {
  User user = new User.init().getCurrentUser();

  VoidCallback onChanged;

  ProfileSettingsDialog({Key key, this.user, this.onChanged}) : super(key: key);

  @override
  _ProfileSettingsDialogState createState() => _ProfileSettingsDialogState();

  static UserEntity() {}
}

class _ProfileSettingsDialogState extends State<ProfileSettingsDialog> {
  GlobalKey<FormState> _profileSettingsFormKey = new GlobalKey<FormState>();
  User _user = new User.init().getCurrentUser();
  UserEntity user = UserEntity();
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
      if (state is Authenticated) {
        user = state.user;
      }
      return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (BuildContext context, AuthenticationState state) {
          if (state is Unauthenticated) {
            Navigator.pushReplacementNamed(context, '/login');
          }
        },
        child: FlatButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    titlePadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    title: Row(
                      children: <Widget>[
                        Icon(
                          Icons.perm_identity,
                          color: Colors.grey[800],
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Configuración de Perfil',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                    children: <Widget>[
                      Form(
                        key: _profileSettingsFormKey,
                        child: Column(
                          children: <Widget>[
                            new TextFormField(
                              style:
                                  TextStyle(color: Theme.of(context).hintColor),
                              keyboardType: TextInputType.text,
                              decoration: getInputDecoration(
                                  hintText: 'Nombre Completo',
                                  labelText: 'Nombre Completo'),
                              initialValue: '${user.displayName}',
                              validator: (input) => input.trim().length < 3
                                  ? 'No es un nombre completo válido'
                                  : null,
                              onSaved: (input) => widget.user.name = input,
                            ),
                            new TextFormField(
                              style:
                                  TextStyle(color: Theme.of(context).hintColor),
                              keyboardType: TextInputType.emailAddress,
                              decoration: getInputDecoration(
                                  hintText: 'username@correo.com',
                                  labelText: 'Dirección de correo electrónico'),
                              initialValue: '${user.email}',
                              validator: (input) => !input.contains('@')
                                  ? 'No es un email valido'
                                  : null,
                              onSaved: (input) => widget.user.email = input,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancelar'),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Guardar',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.end,
                      ),
                      SizedBox(height: 10),
                    ],
                  );
                });
          },
          child: Text(
            "Editar",
          ),
        ),
      );
    });
  }

  InputDecoration getInputDecoration({String hintText, String labelText}) {
    return new InputDecoration(
      hintText: hintText,
      labelText: labelText,
      enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).hintColor.withOpacity(0.2))),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).hintColor)),
    );
  }
}
