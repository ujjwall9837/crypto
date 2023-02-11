// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:cashrich/coincard.dart';
import 'package:cashrich/model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class CryptoPage extends StatefulWidget {
  const CryptoPage({super.key});

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

List<Map<String, dynamic>> data = [];

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
    List<String> coinSymbol = ['BTC', 'ETH', 'LTC'];
    List body = [];
    // var body2;
    coinSymbol.forEach((element) {
      body.add(json.decode(response.body)['data'][element]);
    });
    // print(response.body);
    // print(body);
    if (response.statusCode == 200) {
      setState(() {
        data = [body[0], body[1], body[2]];
      });
      // print(coinSymbol);
      print(data);
      print(data.length);
      print(data[2]["symbol"]);
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
        toolbarHeight: 80,
        backgroundColor: Colors.black,
        title: Center(
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
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 60,
                child: Row(
                  children: [
                    Icon(
                      Icons.pie_chart_outline_sharp,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Show Chart',
                      style: TextStyle(color: Colors.yellow, fontSize: 17),
                    ),
                    SizedBox(
                      width: 200,
                    ),
                    Text(
                      'Count: ' + data.length.toString(),
                      style: TextStyle(color: Colors.yellow),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 700,
              // width: 300,
              child: ListView(
                physics: BouncingScrollPhysics(),
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
  for (var i = 0; i < getCoins().length; i++) {
    list.add(CoinCardPage(getCoins()[i], i));
  }
  return list;
}
