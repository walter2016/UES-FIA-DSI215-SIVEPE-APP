import 'package:flutter/material.dart';

class BarraBusquedaProd extends StatelessWidget {
  final Function onChange;
  BarraBusquedaProd({Key key, @required this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFff9100),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          TextField(
            onChanged: onChange,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12),
              hintText: 'Buscar',
              hintStyle: TextStyle(
                  color: Theme.of(context).focusColor.withOpacity(0.8)),
              prefixIcon: Icon(Icons.search,
                  size: 20, color: Theme.of(context).hintColor),
              border: UnderlineInputBorder(borderSide: BorderSide.none),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }
}
