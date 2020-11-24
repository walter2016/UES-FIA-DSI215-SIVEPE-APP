import 'dart:async';

class Validators {
  final validateCardHolderName = StreamTransformer<String, String>.fromHandlers(
      handleData: (cardHolderName, sink) {
    RegExp('[a-zA-Z]').hasMatch(cardHolderName)
        ? sink.add(cardHolderName)
        : sink.addError('Enter a valid Name');
  });

  final validateCardNumber = StreamTransformer<String, String>.fromHandlers(
      handleData: (cardNumber, sink) {
    //1st Regular Expression to Validate Credit Card Number
    RegExp(r'^(?:4\d([\- ])?\d{6}\1\d{5}|(?:4\d{3}|5[1-5]\d{2}|6011)([\- ])?\d{4}\2\d{4}\2\d{4})$')
            //2nd Regular Expression to remove white spaces
            .hasMatch(cardNumber.replaceAll(RegExp(r'\s+\b|\b\s'), ''))
        ? sink.add(cardNumber)
        : sink.addError('Enter a valid card number');
  });

  final validateCardMonth = StreamTransformer<String, String>.fromHandlers(
      handleData: (cardMonth, sink) {
    if (cardMonth.isNotEmpty &&
        int.parse(cardMonth) > 0 &&
        int.parse(cardMonth) < 13) {
      sink.add(cardMonth);
    } else {
      sink.addError('Err month');
    }
  });

  final validateCardYear = StreamTransformer<String, String>.fromHandlers(
      handleData: (cardYear, sink) {
    if (cardYear.isNotEmpty &&
        int.parse(cardYear) > 2020 &&
        int.parse(cardYear) < 2028) {
      sink.add(cardYear);
    } else {
      sink.addError('Invalid Year');
    }
  });

  final validateCardVerificationValue =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (cardCvv, sink) {
    if (cardCvv.length > 2) {
      sink.add(cardCvv);
    } else {
      sink.addError('Invalid cvv');
    }
  });
}
