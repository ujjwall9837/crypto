import 'package:cashrich/crypto.dart';
import 'package:cashrich/firebase_options.dart';

import 'package:cashrich/login.dart';
import 'package:cashrich/search.dart';
import 'package:cashrich/select.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SelectPage(),
    );
  }
}
