import 'package:flutter/material.dart';
import '../ui/widgets/my_appbar.dart';
import '../blocs/bloc_provider.dart';
import '../blocs/card_bloc.dart';
import '../ui/card_create.dart';

class CardType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _buildTextInfo = Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
      child: Text.rich(
        TextSpan(
            text:
                'Por favor seleccione el tipo de tarjeta que desea ingresar, solo esta habilitado para VISA y MASTERCARD',
            style: TextStyle(fontSize: 14.0, color: Colors.grey[800]),
            children: <TextSpan>[
              /* TextSpan(
                  text: 'Learn More',
                  style: TextStyle(
                      color: Colors.lightBlue, fontWeight: FontWeight.bold)) */
            ]),
        softWrap: true,
        textAlign: TextAlign.center,
      ),
    );

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFFff9100),
          title: Text(
            " Tipo de Tarjeta",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w800,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.keyboard_backspace,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
        body: Container(
            padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildRaisedButton(
                    buttonColor: Color(0xFFff9100),
                    buttonText: 'Tarjeta de Credito',
                    textColor: Colors.white,
                    context: context),
                _buildRaisedButton(
                    buttonColor: Color(0xFFff9100),
                    buttonText: 'Tarjeta de Debito',
                    textColor: Colors.white,
                    context: context),
                _buildTextInfo,
              ],
            )));
  }

  Widget _buildRaisedButton(
      {Color buttonColor,
      String buttonText,
      Color textColor,
      BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: RaisedButton(
        elevation: 1.0,
        onPressed: () {
          var blocProviderCardCreate = BlocProvider(
            bloc: CardBloc(),
            child: CardCreate(),
          );
          blocProviderCardCreate.bloc.selectCardType(buttonText);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => blocProviderCardCreate));
        },
        color: buttonColor,
        child: Text(
          buttonText,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
