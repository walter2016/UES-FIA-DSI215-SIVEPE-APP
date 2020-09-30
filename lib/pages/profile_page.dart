import 'package:com_app_tienda/Users/blocs/authentication_bloc.dart';
import 'package:com_app_tienda/Users/blocs/authentication_event.dart';
import 'package:com_app_tienda/Users/blocs/authentication_state.dart';
import 'package:com_app_tienda/Users/models/user_entity.dart';
import 'package:com_app_tienda/models/user.dart';
import 'package:com_app_tienda/pages/ProfileSettingsDialog.dart';
import 'package:com_app_tienda/pages/afiliacion_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 7),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [BoxShadow(offset: Offset(0, 3), blurRadius: 10)],
                ),
                child: ListView(
                  shrinkWrap: true,
                  primary: false,
                  children: <Widget>[
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.perm_identity),
                      title: Text(
                        'Profile Settings',
                      ),
                      trailing: ButtonTheme(
                        padding: EdgeInsets.all(0),
                        minWidth: 50.0,
                        height: 25.0,
                        child: ProfileSettingsDialog(
                          user: this._user,
                          onChanged: () {
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Full name',
                      ),
                      trailing: Text(
                        '${user.displayName}',
                      ),
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Email',
                      ),
                      trailing: Text(
                        '${user.email}',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [BoxShadow(offset: Offset(0, 3), blurRadius: 10)],
                ),
                child: ListView(
                  shrinkWrap: true,
                  primary: false,
                  children: <Widget>[
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.check),
                      title: Text(
                        'Affiliate',
                      ),
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Full name:',
                      ),
                      trailing: Text(
                        _user.name,
                      ),
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Estado:',
                      ),
                      trailing: Text(
                        'No Affiliate',
                      ),
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Fecha de envio:',
                      ),
                      trailing: Text(
                        '----',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      width: double.infinity,
                      child: RaisedButton(
                        elevation: 4.0,
                        onPressed: () => Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: Afiliacion())),
                        padding: EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Colors.yellow,
                        child: Text(
                          'Ingresar Solicitud',
                          style: TextStyle(
                            color: Color(0xFF527DAA),
                            letterSpacing: 1.5,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [BoxShadow(offset: Offset(0, 3), blurRadius: 10)],
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  width: double.infinity,
                  child: RaisedButton(
                    elevation: 4.0,
                    onPressed: (){
                      authenticationBloc.add(LoggedOut());
                    },
                    padding: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.yellow,
                    child: Text(
                      'Cerrar Sesión',
                      style: TextStyle(
                        color: Color(0xFF527DAA),
                        letterSpacing: 1.5,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
