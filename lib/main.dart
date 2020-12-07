import 'package:com_app_tienda/Animations/FadeAnimation.dart';
import 'package:com_app_tienda/Cart/blocs/cart_bloc.dart';
import 'package:com_app_tienda/Cart/blocs/cart_state.dart';
import 'package:com_app_tienda/Cart/resources/cart_repository.dart';
import 'package:com_app_tienda/Categories/bloc/categories_bloc.dart';
import 'package:com_app_tienda/Categories/resources/category_repository.dart';
import 'package:com_app_tienda/LoginPage.dart';
import 'package:com_app_tienda/Products/bloc/products_bloc.dart';
import 'package:com_app_tienda/Products/resources/products_repository.dart';
import 'package:com_app_tienda/Users/blocs/authentication_bloc.dart';
import 'package:com_app_tienda/Users/resources/user_repository.dart';
import 'package:com_app_tienda/WishList/bloc/deseos_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './pages/home_page.dart' as page;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  firebaseAuth.idTokenChanges().listen((event) {
    event.getIdToken().then((token) {
      print(token);
      SharedPreferences.getInstance().then((SharedPreferences shared) {
        shared.setString('token', token);
      });
    });
  });
  CartRepository _cartRepository = CartRepository();
  CartState initialState = await _cartRepository.getCart();

  final UserRepository userRepository =
      UserRepository(firebaseAuth: firebaseAuth);
  return runApp(BlocProvider(
    create: (BuildContext context) =>
        AuthenticationBloc(userRepository: userRepository),
    child: BlocProvider(
      create: (BuildContext context) =>
          CategoriesBloc(categoryRepository: CategoryRepository()),
      child: BlocProvider(
        create: (BuildContext context) =>
            ProductsBloc(productsRepository: ProductsRepository()),
        child: BlocProvider(
          create: (BuildContext context) => CartBloc(state: initialState),
          child: BlocProvider(
            create: (BuildContext context) => DeseosBloc(),
            child: App(),
          ),
        ),
      ),
    ),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        "/login": (BuildContext context) {
          return LoginScreen();
        },
        "/home": (BuildContext context) {
          return page.HomePage();
        }
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _scaleController;
  AnimationController _scale2Controller;
  AnimationController _widthController;
  AnimationController _positionController;

  Animation<double> _scaleAnimation;
  Animation<double> _scale2Animation;
  Animation<double> _widthAnimation;
  Animation<double> _positionAnimation;

  bool hideIcon = false;

  @override
  void initState() {
    super.initState();

    _scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 50));

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _widthController.forward();
            }
          });

    _widthController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    _widthAnimation =
        Tween<double>(begin: 80.0, end: 300.0).animate(_widthController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _positionController.forward();
            }
          });

    _positionController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _positionAnimation =
        Tween<double>(begin: 0.0, end: 215.0).animate(_positionController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                hideIcon = true;
              });
              _scale2Controller.forward();
            }
          });

    _scale2Controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _scale2Animation =
        Tween<double>(begin: 1.0, end: 32.0).animate(_scale2Controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: LoginScreen()));
            }
          });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFF9800),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -50,
                  left: 0,
                  child: FadeAnimation(
                      1,
                      Container(
                        width: width,
                        height: 400,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/one.png'),
                                fit: BoxFit.cover)),
                      )),
                ),
                Positioned(
                  top: -100,
                  left: 0,
                  child: FadeAnimation(
                      1.3,
                      Container(
                        width: width,
                        height: 400,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/one.png'),
                                fit: BoxFit.cover)),
                      )),
                ),
                Positioned(
                  top: -150,
                  left: 0,
                  child: FadeAnimation(
                      1.6,
                      Container(
                        width: width,
                        height: 400,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/one.png'),
                                fit: BoxFit.cover)),
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeAnimation(
                          1,
                          Text(
                            "Bienvenido",
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      FadeAnimation(
                          1.3,
                          Text(
                            "La tienda en linea ideal para los emprendedores.",
                            style: TextStyle(
                                color: Colors.white.withOpacity(.7),
                                height: 1.4,
                                fontSize: 20),
                          )),
                      SizedBox(
                        height: 180,
                      ),
                      FadeAnimation(
                          1.6,
                          AnimatedBuilder(
                            animation: _scaleController,
                            builder: (context, child) => Transform.scale(
                                scale: _scaleAnimation.value,
                                child: Center(
                                  child: AnimatedBuilder(
                                    animation: _widthController,
                                    builder: (context, child) => Container(
                                      width: _widthAnimation.value,
                                      height: 80,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.white.withOpacity(.5)),
                                      child: InkWell(
                                        onTap: () {
                                          _scaleController.forward();
                                        },
                                        child: Stack(children: <Widget>[
                                          AnimatedBuilder(
                                            animation: _positionController,
                                            builder: (context, child) =>
                                                Positioned(
                                              left: _positionAnimation.value,
                                              child: AnimatedBuilder(
                                                animation: _scale2Controller,
                                                builder: (context, child) =>
                                                    Transform.scale(
                                                        scale: _scale2Animation
                                                            .value,
                                                        child: Container(
                                                          width: 60,
                                                          height: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .orange),
                                                          child:
                                                              hideIcon == false
                                                                  ? Icon(
                                                                      Icons
                                                                          .arrow_forward,
                                                                      color: Colors
                                                                          .white,
                                                                    )
                                                                  : Container(),
                                                        )),
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ),
                                )),
                          )),
                      SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
