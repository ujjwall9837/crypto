import 'package:cashrich/model.dart';
import 'package:flutter/material.dart';

class CoinCardPage extends StatefulWidget {
  CoinDetails coins;
  int index;
  // CoinCardPage({
  //   required this.coins,
  //   required this.index,
  // });
  CoinCardPage(this.coins, this.index);
  @override
  State<CoinCardPage> createState() => _CoinCardPageState();
}

class _CoinCardPageState extends State<CoinCardPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(
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
            right: 16, left: widget.index == 0 ? 16 : 0, bottom: 16, top: 8),
        padding: const EdgeInsets.all(16),
        width: 350,
        height: 120,
        child: Row(
          children: [
            Expanded(
              child: Hero(
                tag: widget.coins.name,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      height: 19,
                      child: Text(
                        widget.coins.name,
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
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        // width: 95,
                        // height: ,
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Price  \$ ' + widget.coins.price.toStringAsFixed(2),
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
                    widget.coins.percent_change_24h > 0
                        ? const Icon(
                            Icons.arrow_upward,
                            color: Colors.green,
                          )
                        : const Icon(
                            Icons.arrow_downward,
                            color: Colors.red,
                          ),
                    const SizedBox(
                        // width: 5,
                        ),
                    Text(
                      widget.coins.percent_change_24h.toStringAsFixed(2) + "%",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(
                      'Rank  ' + widget.coins.cmc_rank,
                      style: const TextStyle(color: Colors.white),
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
                          widget.coins.symbol.toString().toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Icon(
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
}
