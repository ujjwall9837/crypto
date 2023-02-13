import 'package:cashrich/crypto.dart';
import 'package:cashrich/login.dart';
import 'package:cashrich/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  User? user;
  @override
  void initState() {
    newPage(FirebaseAuth.instance.currentUser);
    super.initState();
  }

  void newPage(userCred) {
    setState(() {
      user = userCred;
    });
  }

  Widget build(BuildContext context) {
    if (user == null) {
      return LoginPage(
        onsingIn: (userCred) => newPage(userCred),
      );
    } else {
      return SearchPage(
        onSignOut: (userCred) => newPage(userCred),
      );
    }
  }
}
