import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class CoinCardPage extends StatelessWidget {
  // String price = '23749134234';
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
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'CashRich',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 120,
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
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(-1, -1),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Expanded(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  name,
                                  style: TextStyle(
                                      color: Colors.yellow,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              // 'Price',
                              'Price  \$' +
                                  price.toDouble().toString().substring(0, 3),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_upward,
                                    color: percent_change < 0
                                        ? Colors.green
                                        : Colors.red,
                                    size: 14,
                                  ),
                                  Text(
                                    percent_change.toDouble().toString(),
                                    style: TextStyle(
                                        color: percent_change < 0
                                            ? Colors.green
                                            : Colors.red,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Rank' + cmc_rank.toDouble().toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 10,
                                color: Colors.grey[900],
                                child: Text(
                                  symbol.toString().toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
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
            ),
          ],
        ),
      ),
    );
  }
}
//     return Flexible(
//         child: Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Container(
//         height: 150,
//         decoration: BoxDecoration(
//           color: Colors.black87,
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: const [
//             BoxShadow(
//               color: Colors.grey,
//               offset: Offset(1, 1),
//               blurRadius: 10,
//               spreadRadius: 1,
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             SizedBox(
//               width: 20,
//             ),
//             Column(
//               children: [
//                 SizedBox(height: 10),
//                 Container(
//                   height: 80,
//                   width: 80,
//                   child: Text(
//                     name,
//                     style: TextStyle(
//                         color: Colors.yellow,
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                       height: 30,
//                       width: 40,
//                       child: Text(
//                         'Price',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 15,
//                             fontWeight: FontWeight.normal),
//                       ),
//                     ),
//                     Container(
//                       height: 30,
//                       width: 40,
//                       child: Text(
//                         '\$' + price.toDouble().toString().trim(),
//                         // textAlign: TextAlign.justify,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 15,
//                             fontWeight: FontWeight.normal),
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 150,
//               width: 15,
//             ),
//             Column(
//               children: [
//                 SizedBox(
//                   height: 13,
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                       height: 30,
//                       width: 20,
//                       child: Icon(
//                         Icons.arrow_upward,
//                         color: Colors.green,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 1,
//                       width: 3,
//                     ),
//                     Text(
//                       percent_change.toDouble().toString().trim() + '%',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 15,
//                           fontWeight: FontWeight.normal),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 68,
//                 ),
//                 Text(
//                   'Rank    ' + cmc_rank.toDouble().toString(),
//                   // textAlign: TextAlign.justify,
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 15,
//                       fontWeight: FontWeight.normal),
//                 ),
//               ],
//             ),
//             SizedBox(
//               width: 80,
//             ),
//             Column(
//               children: [
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   color: Colors.grey[700],
//                   height: 20,
//                   width: 70,
//                   child: Text(
//                     symbol,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 50,
//                   height: 55,
//                 ),
//                 Icon(
//                   Icons.arrow_circle_right_rounded,
//                   color: Colors.yellow,
//                   size: 40,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }
