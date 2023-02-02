class Coin {
  Coin({
    required this.name,
    required this.symbol,
    required this.cmc_rank,
    required this.price,
    required this.percent_change,
  });
  String name;
  String symbol;
  num cmc_rank;
  num price;
  num percent_change;

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      name: json['name'],
      symbol: json['symbol'],
      cmc_rank: json['cmc_rank'],
      price: json['price'],
      percent_change: json['percent_change_24h'],
    );
  }
}

List<Coin> coinList = [];
