import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../models/card_color_model.dart';
import '../helpers/card_colors.dart';
import '../models/card_model.dart';
import './validators.dart';
import '../blocs/bloc_provider.dart';
import '../blocs/card_list_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CardBloc with Validators implements BlocBase {
  BehaviorSubject<String> _cardHolderName = BehaviorSubject<String>();
  BehaviorSubject<String> _cardNumber = BehaviorSubject<String>();
  BehaviorSubject<String> _cardMonth = BehaviorSubject<String>();
  BehaviorSubject<String> _cardYear = BehaviorSubject<String>();
  BehaviorSubject<String> _cardCvv = BehaviorSubject<String>();
  BehaviorSubject<String> _cardType = BehaviorSubject<String>();
  BehaviorSubject<int> _cardColorIndexSelected =
      BehaviorSubject<int>(seedValue: 0);

  final _cardsColors =  BehaviorSubject<List<CardColorModel>>();

  //Add data stream
  Function(String) get changeCardHolderName => _cardHolderName.sink.add;
  Function(String) get changeCardNumber => _cardNumber.sink.add;
  Function(String) get changeCardMonth => _cardMonth.sink.add;
  Function(String) get changeCardYear => _cardYear.sink.add;
  Function(String) get changeCardCvv => _cardCvv.sink.add;
  Function(String) get selectCardType => _cardType.sink.add;

  //Retrieve data from stream
  Stream<String> get cardHolderName =>
      _cardHolderName.stream.transform(validateCardHolderName);
  Stream<String> get cardNumber =>
      _cardNumber.stream.transform(validateCardNumber);
  Stream<String> get cardMonth =>
      _cardMonth.stream.transform(validateCardMonth);
  Stream<String> get cardYear => _cardYear.stream.transform(validateCardYear);
  Stream<String> get cardCvv =>
      _cardCvv.stream.transform(validateCardVerificationValue);
  Stream<String> get cardType => _cardType.stream;
  Stream<int> get cardColorIndexSelected => _cardColorIndexSelected.stream;
  Stream<List<CardColorModel>> get cardColorsList => _cardsColors.stream;
  Stream<bool> get savecardValid => Observable.combineLatest5(cardHolderName,
      cardNumber, cardMonth, cardYear, cardCvv, (ch, cn, cm, cy, cv) => true);

  void saveCard() async {
    final shared = await SharedPreferences.getInstance();

    final data = shared.getString("tarjeta");

    if (data == null) {
      // print('la data esta vacia');
      final list = [];
      final json = jsonEncode(list);
      shared.setString("tarjeta", json);
      // final prueba = shared.getString("tarjeta");
      // print('Se crea la data');
      // print(prueba);
      // print('imprimimimos');
//print(jsonDecode(prueba));
    }
    final dataL = shared.getString("tarjeta");
    final decoded = jsonDecode(dataL) as List;
    decoded.add({
      "cardHolderName": _cardHolderName.value,
      "cardNumber": _cardNumber.value.replaceAll(RegExp(r'\s+\b|\b\s'), ''),
      "cardMonth": _cardMonth.value,
      "cardYear": _cardYear.value,
      "cardCvv": _cardCvv.value,
      "cardColor":
          CardColor.baseColors[_cardColorIndexSelected.value].toString(),
      "cardType": _cardType.value
    });

    shared.setString("tarjeta", jsonEncode(decoded));
    final data2 = shared.getString("tarjeta");

    final decodeList = jsonDecode(data2) as List;
    final listTarjetas = {"cardResults": decodeList};

    shared.setString("Listatarjeta", jsonEncode(listTarjetas));
    //  print(listTarjetas);
    cardListBloc.initialData();
  }

  void selectCardColor(int colorIndex){
    CardColor.cardColors.forEach((element) => element.isSelected = false);
    CardColor.cardColors[colorIndex].isSelected = true;
    _cardsColors.sink.add(CardColor.cardColors);
    _cardColorIndexSelected.sink.add(colorIndex);
  }

  void dispose(){
    _cardHolderName.close();
    _cardNumber.close();
    _cardMonth.close();
    _cardYear.close();
    _cardCvv.close();
    _cardsColors.close();
    _cardColorIndexSelected.close();
    _cardType.close();
  }

}