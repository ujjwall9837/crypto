class CoinDetails {
  String name;
  String symbol;
  String cmc_rank;
  double price;
  double percent_change_24h;
  CoinDetails(
    this.name,
    this.symbol,
    this.cmc_rank,
    this.price,
    this.percent_change_24h,
  );

  String toString() {
    return "name: $name, symbol: $symbol, cmc_rank: $cmc_rank  , price: $price , percent_change_24h: $percent_change_24h";
  }
}
