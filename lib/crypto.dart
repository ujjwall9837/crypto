// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:cashrich/coincard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'coin.dart';
import 'package:http/http.dart' as http;

class CryptoPage extends StatefulWidget {
  const CryptoPage({super.key});

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'X-CMC_PRO_API_KEY': '27ab17d1-215f-49e5-9ca4-afd48810c149',
    };
    final response = await http.get(
        Uri.parse(
            'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=BTC,ETHLTC'),
        headers: requestHeaders);
    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
        print(coinList.first.symbol);
        setState(() {
          coinList;
        });
      }
      return coinList;
    } else {
      throw Exception('Failed to load coins ');
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
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            'COINRICH',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 40,
            ),
            textAlign: TextAlign.center,

            // textDirection: TextAlign.center,
          ),
        ),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: coinList.length,
          itemBuilder: (context, index) {
            return CoinCardPage(
              name: coinList[index].name,
              symbol: coinList[index].symbol,
              cmc_rank: coinList[index].cmc_rank.toDouble(),
              price: coinList[index].price.toDouble(),
              percent_change: coinList[index].percent_change.toDouble(),
            );
          }),
      // body: ListView(
      //   scrollDirection: Axis.vertical,
      //   children: [
      //     SizedBox(
      //       height: 90,
      //     ),

      // CoinCardPage(
      //   name: 'Bitcoin',
      //   symbol: 'hello',
      //   cmc_rank: 3,
      //   percent_change: 4,
      //   price: 10,
      // ),
      // CoinCardPage(
      //   name: 'Bitcoin',
      //   symbol: 'hello',
      //   cmc_rank: 3,
      //   percent_change: 4,
      //   price: 10,
      // ),
      // CoinCardPage(
      //   name: 'Bitcoin',
      //   symbol: 'hello',
      //   cmc_rank: 3,
      //   percent_change: 4,
      //   price: 10,
      // ),
      // ],
    );
  }
}
