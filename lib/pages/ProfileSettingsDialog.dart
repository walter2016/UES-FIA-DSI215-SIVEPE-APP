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
                        Icon(Icons.perm_identity),
                        SizedBox(width: 10),
                        Text(
                          'Profile Settings',
                          style: Theme.of(context).textTheme.body2,
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
                                  hintText: 'John Doe', labelText: 'Full Name'),
                              initialValue: '${user.displayName}',
                              validator: (input) => input.trim().length < 3
                                  ? 'Not a valid full name'
                                  : null,
                              onSaved: (input) => widget.user.name = input,
                            ),
                            new TextFormField(
                              style:
                                  TextStyle(color: Theme.of(context).hintColor),
                              keyboardType: TextInputType.emailAddress,
                              decoration: getInputDecoration(
                                  hintText: 'johndo@gmail.com',
                                  labelText: 'Email Address'),
                              initialValue: '${user.email}',
                              validator: (input) => !input.contains('@')
                                  ? 'Not a valid email'
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
                            child: Text('Cancel'),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Save',
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
            "Edit",
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
