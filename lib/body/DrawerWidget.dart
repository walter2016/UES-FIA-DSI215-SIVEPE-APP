import 'package:com_app_tienda/Ordenes/orders.dart';
import 'package:com_app_tienda/Users/blocs/authentication_bloc.dart';
import 'package:com_app_tienda/Users/blocs/authentication_event.dart';
import 'package:com_app_tienda/Users/blocs/authentication_state.dart';
import 'package:com_app_tienda/Users/models/user_entity.dart';
import 'package:com_app_tienda/models/user.dart';
import 'package:com_app_tienda/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
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
    // TODO: implement build
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
          child: Drawer(
            child: ListView(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Tabs', arguments: 1);
                  },
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor.withOpacity(0.1),
//              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35)),
                    ),
                    accountName: Text(
                      '${user.displayName}',
                      style: Theme.of(context).textTheme.title,
                    ),
                    accountEmail: Text(
                      '${user.email}',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Theme.of(context).accentColor,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: HomePage()));
                  },
                  leading: Icon(
                    Icons.home,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    "Inicio",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return HomePage(
                        initialTab: 2,
                      );
                    }));
                  },
                  leading: Icon(
                    Icons.shopping_cart,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    "Carrito",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return HomePage(
                        initialTab: 1,
                      );
                    }));
                  },
                  leading: Icon(
                    Icons.favorite,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    "Lista de Deseos",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: OrdersWidget()));
                  },
                  leading: Icon(
                    Icons.assignment,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    "Mis Ordenes",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    "Productos",
                    style: Theme.of(context).textTheme.body1,
                  ),
                  trailing: Icon(
                    Icons.remove,
                    color: Theme.of(context).focusColor.withOpacity(0.3),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: HomePage()));
                  },
                  leading: Icon(
                    Icons.folder,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    "Categorias",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    "Preferencias de la Aplicación",
                    style: Theme.of(context).textTheme.body1,
                  ),
                  trailing: Icon(
                    Icons.remove,
                    color: Theme.of(context).focusColor.withOpacity(0.3),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Tabs', arguments: 1);
                  },
                  leading: Icon(
                    Icons.settings,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    "Ajustes",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  onTap: () {
                    authenticationBloc.add(LoggedOut());
                  },
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    "Salir",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    "Version 1.0.0",
                    style: Theme.of(context).textTheme.body1,
                  ),
                  trailing: Icon(
                    Icons.remove,
                    color: Theme.of(context).focusColor.withOpacity(0.3),
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
