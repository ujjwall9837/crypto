import 'dart:convert';
import 'dart:math';

import 'package:cashrich/coincard.dart';

import 'package:cashrich/model.dart';
import 'package:cashrich/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CryptoPage extends StatefulWidget {
  // final Function(User?) onSignOut
  List<String> coinSymbol;

  CryptoPage({super.key, required this.coinSymbol});
//  required this.onSignOut
  // Future<void> logout() async {
  //   await FirebaseAuth.instance.signOut();
  //   onSignOut(null);
  // }

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

List<Map<String, dynamic>> data = [];
// btc
// List<String> coinSymbol = ['BTC'];

class _CryptoPageState extends State<CryptoPage> {
  void fetchCoin() async {
    List<CoinDetails> coins = [];
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'X-CMC_PRO_API_KEY': '27ab17d1-215f-49e5-9ca4-afd48810c149',
    };
    final response = await http.get(
        Uri.parse(
            'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=BTC,ETH,LTC'),
        headers: requestHeaders);

    // Map<String, dynamic> values = {};
    // List <String> coins = ['BT']
    List body1 = [];
    // var body2;

    int length;
    if (widget.coinSymbol[0].isEmpty)
      length = 0;
    else
      length = widget.coinSymbol.length;
    if (length == 0) {
      body1.add(json.decode(response.body)['data']['BTC']);

      body1.add(json.decode(response.body)['data']['ETH']);
      body1.add(json.decode(response.body)['data']['LTC']);
    } else {
      widget.coinSymbol.forEach((element) {
        body1.add(json.decode(response.body)['data'][element]);
      });
    }
    print(body1.length);

    // print(response.body);
    // print(body);
    if (response.statusCode == 200) {
      setState(() {
        // data = [body1[0], body1[1], body1[2]];
        for (var i = 0; i < body1.length; i++) {
          data.add(body1[i]);
        }
      });

      // print(coinSymbol);
      // print(data);
      // print(data.length);
      // print(data[2]["symbol"]);
    } else {
      setState(() {
        data = [];
      });
    }
  }

  @override
  void initState() {
    fetchCoin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              setState(
                () {
                  data = [];
                },
              );

              Navigator.of(context).pop();
            },
            tooltip: 'Logout',
            color: Colors.yellow,
          )
        ],
        title: const Center(
          child: Text(
            'CashRich',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 40,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 60,
                child: Row(
                  children: [
                    const Icon(
                      Icons.pie_chart_outline_sharp,
                      color: Colors.yellow,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Show Chart',
                      style: TextStyle(color: Colors.yellow, fontSize: 17),
                    ),
                    const SizedBox(
                      width: 200,
                    ),
                    Text(
                      'Count: ' + data.length.toString(),
                      style: const TextStyle(color: Colors.yellow),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 700,
              // width: 300,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: buildCoins(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<CoinDetails> getCoins() {
  // print('getcoins');
  // print(data.length);
  return <CoinDetails>[
    for (int i = 0; i < data.length; i++)
      CoinDetails(
          data[i]['name'].toString(),
          data[i]['symbol'].toString(),
          data[i]['cmc_rank'].toString(),
          data[i]['quote']['USD']['price'],
          data[i]['quote']['USD']['percent_change_24h']),
  ];
}

List<Widget> buildCoins() {
  List<Widget> list = [];
  // print('buildcoins');
  // print(getCoins().length);
  for (var i = 0; i < (getCoins().length); i++) {
    list.add(CoinCardPage(getCoins()[i], i));
  }
  return list;
}
