import 'dart:convert';

import 'package:com_app_tienda/Tarjetas/blocs/card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/card_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../blocs/card_list_bloc.dart';
import '../widgets/card_chip.dart';

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return StreamBuilder<List<CardResults>>(
      stream: cardListBloc.cardList,
      builder: (context, snapshot) {
        return Column(
          children: <Widget>[
            !snapshot.hasData || snapshot.data.isEmpty
                ? Center(
                    child: Text('No tiene Tarjetas Agregadas'),
                  )
                : SizedBox(
                    height: _screenSize.height * 0.8,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return CardFrontList(
                          cardModel: snapshot.data[index],
                        );
                      },
                      itemCount: snapshot.data.length,
                      itemWidth: _screenSize.width * 0.7,
                      itemHeight: _screenSize.height * 0.52,
                      layout: SwiperLayout.STACK,
                      scrollDirection: Axis.vertical,
                    ))
          ],
        );
      },
    );
  }
}

class CardFrontList extends StatelessWidget {
  final CardResults cardModel;
  CardFrontList({this.cardModel});

  @override
  Widget build(BuildContext context) {
    final _cardLogo = Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 25.0, right: 52.0),
          child: Image(
            image: AssetImage('assets/images/visa_logo.png'),
            width: 65.0,
            height: 32.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 52.0),
          child: Text(
            cardModel.cardType,
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );

    final _cardNumber = Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildDots(),
        ],
      ),
    );

    final _cardLastNumber = Padding(
      padding: const EdgeInsets.only(top: 1.0, left: 55.0),
      child: Text(
        cardModel.cardNumber.substring(12),
        style: TextStyle(color: Colors.white, fontSize: 8.0),
      ),
    );

    final _cardValidThru = Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  'valid',
                  style: TextStyle(color: Colors.white, fontSize: 8.0),
                ),
                Text(
                  'thru',
                  style: TextStyle(color: Colors.white, fontSize: 8.0),
                ),
              ],
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              '${cardModel.cardMonth}/${cardModel.cardYear.substring(2)}',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ],
        ));

    final _cardOwner = Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 50.0),
      child: Text(
        cardModel.cardHolderName,
        style: TextStyle(color: Colors.white, fontSize: 18.0),
      ),
    );

    return GestureDetector(
      onTap: () {
        print(cardModel.cardNumber);
      },
      onLongPress: () {
        final snackBar = SnackBar(
          content: Text(
              'La tarjeta "${cardModel.cardHolderName}" se eliminara de la lista '),
          action: SnackBarAction(
            label: 'Eliminar',
            onPressed: () {
              print('Eliminar');
              _deleteCard();
            },
          ),
        );

        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: _selectColor(cardModel.cardColor),
          ),
          child: RotatedBox(
            quarterTurns: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _cardLogo,
                CardChip(),
                _cardNumber,
                _cardLastNumber,
                _cardValidThru,
                _cardOwner,
              ],
            ),
          )),
    );
  }

  Color _selectColor(String color) {
    if (color.toString() == 'Color(0xff3d84df)') {
      return Color.fromRGBO(61, 132, 223, 1.0);
    }

    if (color == 'Color(0xff7247c8)') return Color.fromRGBO(114, 71, 200, 1.0);
    if (color == 'Color(0xff6abc79)') return Color.fromRGBO(106, 188, 121, 1.0);
    if (color == 'Color(0xffe55c83)') return Color.fromRGBO(229, 92, 131, 1.0);
    if (color == 'Color(0xff60c8e3)') return Color.fromRGBO(96, 200, 227, 1.0);
    if (color == 'Color(0xffdb9d50)') return Color.fromRGBO(219, 157, 80, 1.0);
    if (color.toString() == 'Color(0xff3c3d3f)')
      return Color.fromRGBO(60, 61, 63, 1.0);
    if (color == 'Color(0xffde5874)') return Color.fromRGBO(222, 88, 116, 1.0);
    if (color == 'Color(0xff80b6ea)') return Color.fromRGBO(128, 182, 234, 1.0);
    return Color(0xFFff9100);
  }

  _deleteCard() async {
    final shared = await SharedPreferences.getInstance();
    final listaCard = shared.getString('tarjeta');
    var decoded = jsonDecode(listaCard);

    print('listTarjetas inicial');

    dynamic a = null;
    print(decoded);
    decoded.forEach((element) {
      if (element['cardHolderName'] == cardModel.cardHolderName) {
        if (element['cardNumber'] == cardModel.cardNumber) {
          a = element;
        }
      }
    });

    decoded.remove(a);
    print('decoded');
    print(decoded);
    shared.setString("tarjeta", jsonEncode(decoded));
    final data2 = shared.getString("tarjeta");

    final decodeList = jsonDecode(data2) as List;
    final listTarjetas = {"cardResults": decodeList};

    shared.setString("Listatarjeta", jsonEncode(listTarjetas));
    cardListBloc.initialData();
  }

  Widget _buildDots() {
    List<Widget> dotList = new List<Widget>();
    var counter = 0;
    for (var i = 0; i < 12; i++) {
      counter += 1;
      dotList.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.0),
          child: Container(
            width: 6.0,
            height: 6.0,
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
      if (counter == 4) {
        counter = 0;
        dotList.add(SizedBox(width: 40.0));
      }
    }
    dotList.add(_buildNumbers());
    return Row(children: dotList);
  }

  Widget _buildNumbers() {
    return Text(
      cardModel.cardNumber.substring(12),
      style: TextStyle(color: Colors.white),
    );
  }
}
