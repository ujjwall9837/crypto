import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'coin.dart';

class CoinCardPage extends StatelessWidget {
  CoinCardPage({
    required this.name,
    required this.symbol,
    required this.cmc_rank,
    required this.price,
    required this.percent_change,
  });
  String name;
  String symbol;
  double cmc_rank;
  double price;
  double percent_change;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1, 1),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                SizedBox(height: 10),
                Container(
                  height: 80,
                  width: 100,
                  child: Text(
                    name,
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 50,
                      child: Text(
                        'Price',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 50,
                      child: Text(
                        '\$' + price.toDouble().toString(),
                        // textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 150,
              width: 15,
            ),
            Column(
              children: [
                SizedBox(
                  height: 13,
                ),
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 20,
                      child: Icon(
                        Icons.arrow_upward,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(
                      height: 1,
                      width: 3,
                    ),
                    Text(
                      percent_change.toDouble().toString() + '%',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                SizedBox(
                  height: 68,
                ),
                Text(
                  'Rank    ' + cmc_rank.toDouble().toString(),
                  // textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            SizedBox(
              width: 100,
            ),
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.grey[700],
                  height: 20,
                  width: 70,
                  child: Text(
                    symbol,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 70,
                  height: 55,
                ),
                Icon(
                  Icons.arrow_circle_right_rounded,
                  color: Colors.yellow,
                  size: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
