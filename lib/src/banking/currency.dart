class Currency {
  static const String INR = "INR";
  static const String EUR = "EUR";
  static const String USD = "USD";
  static const String GBP = "GBP";
  static const String AUD = "AUD";
  static const String JPY = "JPY";

  /**
   * Valid Currencies
   */
  static Set<String> currenciesSupported = Set.of([INR, EUR, USD, GBP, AUD, JPY]);

  /**
   * Check if the given currency is valid
   *
   * @param currency Currency to check
   * @return true if a valid currency
   */
  static bool isValidCurrency(String currency) {
    return currency != null && currenciesSupported.contains(currency);
  }
}
