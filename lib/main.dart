// import 'package:cashrich/api_service.dart';

import 'package:cashrich/crypto.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CryptoPage(),
    );
  }
}
