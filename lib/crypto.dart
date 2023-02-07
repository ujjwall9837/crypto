// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:cashrich/coincard.dart';
import 'package:cashrich/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
    list.add(buildCoinsCard(getCoins()[i], i));
  }
  return list;
}

Widget buildCoinsCard(CoinDetails coins, int index) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(-1, -1),
          ),
        ],
      ),
      margin: EdgeInsets.only(
          right: 16, left: index == 0 ? 16 : 0, bottom: 16, top: 8),
      padding: EdgeInsets.all(16),
      width: 350,
      height: 120,
      child: Row(
        children: [
          Expanded(
            child: Hero(
              tag: coins.name,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    height: 19,
                    child: Text(
                      coins.name,
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      // width: 95,
                      // height: ,
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Price  \$ ' + coins.price.toStringAsFixed(2),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: 40,
              ),
              Row(
                children: [
                  Icon(
                    Icons.arrow_upward,
                    color: coins.percent_change_24h > 0
                        ? Colors.green
                        : Colors.red,
                  ),
                  SizedBox(
                      // width: 5,
                      ),
                  Text(
                    coins.percent_change_24h.toStringAsPrecision(2) + "%",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    'Rank  ' + coins.cmc_rank,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 40,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 10,
                      color: Colors.grey[900],
                      child: Text(
                        coins.symbol.toString().toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Icon(
                  Icons.arrow_circle_right_rounded,
                  color: Colors.yellow,
                  size: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
