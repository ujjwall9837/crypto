class CoinDetails {
  String name;
  String symbol;
  num cmc_rank;
  num price;
  num percent_change;
  CoinDetails({
    required this.name,
    required this.symbol,
    required this.cmc_rank,
    required this.price,
    required this.percent_change,
  });

  factory CoinDetails.fromJSON(Map<String, dynamic> json) {
    // print(json["name"]);
    // print(json["symbol"]);
    // print(json["cmc_rank"]);
    // print(json["price"]);
    // print(json["percent_change_24h"]);

    return CoinDetails(
      name: json["name"],
      symbol: json["symbol"],
      cmc_rank: json["cmc_rank"],
      price: json["price"] ?? 0,
      percent_change: json["percent_change_24h"] ?? 0,
    );
  }
  String toString() {
    return "name: $name, symbol: $symbol, cmc_rank: $cmc_rank  , price: $price , percent_change: $percent_change";
  }
}

// class CoinDetailsDeep {
//   num price;
//   num percent_change;
//   CoinDetailsDeep({
//     required this.price,
//     required this.percent_change,
//   });

//   factory CoinDetailsDeep.fromJSON(Map<String, dynamic> json) {
//     // print(json["name"]);
//     // print(json["symbol"]);
//     // print(json["cmc_rank"]);
//     print(json["price"]);
//     print(json["percent_change_24h"]);

//     return CoinDetailsDeep(
//       // name: json["name"],
//       // symbol: json["symbol"],
//       // cmc_rank: json["cmc_rank"],
//       price: json["price"] ?? 0,
//       percent_change: json["percent_change_24h"] ?? 0,
//     );
//   }
// }
