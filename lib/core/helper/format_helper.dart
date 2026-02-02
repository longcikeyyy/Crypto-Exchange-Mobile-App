

class FormatHelper {
  /// Format price 
  static String formatPrice(String price) {
    try {
      double priceValue = double.parse(price);
      return priceValue.toStringAsFixed(2);
    } catch (e) {
      return '0.00';
    }
  }



  /// Check if price change percent is positive
  static bool isPositiveChange(String priceChangePercent) {
    try {
      return double.parse(priceChangePercent) >= 0;
    } catch (e) {
      return true;
    }
  }
}
