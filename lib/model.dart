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
    print(json["name"]);
    print(json["symbol"]);
    print(json["cmc_rank"]);
    print(json["quote"]["USD"]["price"]);
    print(json["quote"]["USD"]["percent_change_24h"]);

    return CoinDetails(
      name: json["name"] ?? "n",
      symbol: json["symbol"] ?? "s",
      cmc_rank: json["cmc_rank"] ?? 0,
      price: json["quote"]["USD"]["price"] ?? 0,
      percent_change: json["quote"]["USD"]["percent_change_24h"] ?? 0,
    );
  }

  String toString() {
    return "name: $name, symbol: $symbol, cmc_rank: $cmc_rank  , price: $price , percent_change: $percent_change";
  }
}
