import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFFfb8c00),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 8.0,
      offset: Offset(0, 3),
    ),
  ],
);

// In release mode this constant will be tree-shaked
final kBaseUrl = kReleaseMode
        ? "http://ec2-34-239-124-79.compute-1.amazonaws.com/api/"
        : "http://192.168.0.12:8080/api/"
    // "http://ec2-34-239-124-79.compute-1.amazonaws.com/api/"
    ;
