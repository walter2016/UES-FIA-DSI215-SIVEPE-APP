import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/card_model.dart';
import 'dart:convert';
import '../helpers/card_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardListBloc {
  BehaviorSubject<List<CardResults>> _cardsCollection =
      BehaviorSubject<List<CardResults>>();

  List<CardResults> _cardResults;

  //Retrieve data from Stream
  Stream<List<CardResults>> get cardList => _cardsCollection.stream;

  void initialData() async {
    /*
    // GUARDAR LA LISTA
    final list = [];
    final listTarjetas = {"cardResults": };
    final json = jsonEncode(list);
    final listjson = jsonEncode(listTarjetas);
    // GUARDAR LA LISTA
    final shared = await SharedPreferences.getInstance();
    shared.setString("tarjeta", json);
    shared..setString("Listatarjeta", listjson);

    */
    final shared = await SharedPreferences.getInstance();

    //print('String');
    //print(initialData2);

    //print('json');
    // print(decodedJson2);
    var initialData = shared.getString("Listatarjeta");
    //print('Shares Preference');
    // print(initialData);
    if (initialData != null) {
      var decodedJson = jsonDecode(initialData);
      _cardResults = CardModel.fromJson(decodedJson).results;
      _cardsCollection.sink.add(_cardResults);
    }
  }

  CardListBloc(){
    initialData();
  }

  /*void addCardToList(CardResults newCard) {
    _cardResults.add(newCard);
    _cardsCollection.sink.add(_cardResults);
  }
  */

  void dispose() {
    _cardsCollection.close();
  }
}

final cardListBloc = CardListBloc();