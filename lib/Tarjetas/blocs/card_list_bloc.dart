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
    final shared = await SharedPreferences.getInstance();

    var initialData = shared.getString("Listatarjeta");

    if (initialData != null) {
      var decodedJson = jsonDecode(initialData);
      _cardResults = CardModel.fromJson(decodedJson).results;
      _cardsCollection.sink.add(_cardResults);
    }
  }

  CardListBloc() {
    initialData();
  }

  void dispose() {
    _cardsCollection.close();
  }
}

final cardListBloc = CardListBloc();
