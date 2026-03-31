class CoinData {
  const CoinData({
    required this.value,
    required this.pair,
    required this.change,
    required this.icon,
    required this.isPositive,
  });

  final String value;
  final String pair;
  final String change;
  final String icon;
  final bool isPositive;
}
