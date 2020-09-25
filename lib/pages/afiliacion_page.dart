import 'package:flutter/material.dart';

class Afiliacion extends StatefulWidget {
  const Afiliacion({Key key}) : super(key: key);

  @override
  _AfiliacionState createState() => _AfiliacionState();
}

class _AfiliacionState extends State<Afiliacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF9800),
        title: Text('Afliliacion'),
      ),
    );
  }
}
