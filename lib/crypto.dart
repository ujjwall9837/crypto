// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:cashrich/coincard.dart';
import 'package:cashrich/model.dart';
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
  List<CoinDetails> coinDetails = [];
  Future<List<CoinDetails>> fetchCoin() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'X-CMC_PRO_API_KEY': '27ab17d1-215f-49e5-9ca4-afd48810c149',
    };
    final response = await http.get(
        Uri.parse(
            'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=BTC,ETHLTC'),
        headers: requestHeaders);

    // Map<String, dynamic> values = {};
    var body = jsonDecode(response.body);
    // print(response.body);

    if (response.statusCode == 200) {
      List<String> coinSymbol = ['BTC', 'ETH', 'LTC'];
      coinSymbol.forEach((element) {
        coinDetails.add(CoinDetails.fromJSON(body["data"][element]));
        coinDetails
            .add(CoinDetails.fromJSON(body["data"][element]["quote"]["USD"]));
      });
      // print(body["data"][val]["quote"]["USD"]);
      // coinDetails.add(CoinDetailsDeep.fromJSON(body["data"][val]["quote"]) );

      // for (int i = 0; i < 3; i++) {
      //   // print(json["name"]);
      // }
      return coinDetails;
    } else {
      return coinDetails;
    }
  }

  // @override
  // void initState() {
  //   fetchCoin();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // print(coinDetails[coinDetails.length].data);
    //   return Scaffold(
    //     backgroundColor: Colors.grey[900],
    //     appBar: AppBar(
    //       backgroundColor: Colors.black,
    //       title: const Center(
    //         child: Text(
    //           'CashRich',
    //           style: TextStyle(
    //             fontWeight: FontWeight.bold,
    //             color: Colors.white,
    //             fontSize: 40,
    //           ),
    //           textAlign: TextAlign.center,

    //           // textDirection: TextAlign.center,
    //         ),
    //       ),
    //     ),
    //     body: ListView.builder(
    //       scrollDirection: Axis.vertical,
    //       itemCount: coinDetails.length,
    //       itemBuilder: (context, index) {
    //         return CoinCardPage(
    //           name: '${coinDetails[index].data[index]!.name},',
    //           symbol: '${coinDetails[index].data[index]!.symbol},',
    //           cmc_rank: 3,
    //           price: 2,
    //           percent_change: 1,
    //         );
    //       },
    //     ),
    //   );
    // }
    return FutureBuilder<List<CoinDetails>>(
        future: fetchCoin(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          print(snapshot.data);

          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: coinDetails.length,
                itemBuilder: (context, index) {
                  return CoinCardPage(
                      name: coinDetails[index].name.toString(),
                      symbol: coinDetails[index].symbol.toString(),
                      cmc_rank: coinDetails[index].cmc_rank.toDouble(),
                      price: coinDetails[index].price.toDouble(),
                      percent_change: coinDetails[index].price.toDouble());
                });
          } else {
            return Center(
              child: Text('helo'),
            );
          }
        });

    // return Scaffold(
    //   body: Column(
    //     children: [
    //       Text('hello'),
    //       Text(coinDetails.price.toString()),
    //     ],
    //   ),
    // );
  }
}
