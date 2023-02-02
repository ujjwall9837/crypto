// import 'package:cashrich/api_service.dart';
import 'dart:io';

import 'package:cashrich/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CryptoPage(),
    );
  }
}
