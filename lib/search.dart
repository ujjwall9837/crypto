import 'package:cashrich/button.dart';
import 'package:cashrich/crypto.dart';
import 'package:cashrich/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchPage extends StatefulWidget {
  final Function(User?) onSignOut;
  SearchPage({super.key, required this.onSignOut});

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    onSignOut(null);
  }

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final coinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text(
          'Select Coins',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Names of Coins Seperated by ,',
                      border: InputBorder.none,
                      errorText: (coinController.value.text.isEmpty)
                          ? 'Cant be empty'
                          : 'lets go',
                    ),
                    controller: coinController,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            signInButton(context, () {
              List<String> list = coinController.text.split(',');
              for (var i = 0; i < list.length; i++) {
                list[i] = list[i].toUpperCase();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CryptoPage(coinSymbol: list),
                  ),
                );
              }
              print(list);
            }, 'SHOW'),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/image2.jpg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            signInButton(context, () {
              widget.logout();
              // Navigator.push(context,
              //   MaterialPageRoute(builder: (context) => LoginPage()));
            }, 'Sign Out')
          ],
        ),
      ),
    );
  }
}
