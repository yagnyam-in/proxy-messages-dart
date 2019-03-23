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
  static final Set<String> currenciesSupported = Set.of([INR, EUR, USD, GBP, AUD, JPY]);


  /**
   * Valid Currencies
   */
  static final Map<String, String> currencySymbols = {
    INR: '\u{20B9}',
    EUR: '\u{20AC}',
    USD: '\u{0024}',
    GBP: '\u{00A3}',
    JPY: '\u{00A5}',
  };
  /**
   * Check if the given currency is valid
   *
   * @param currency Currency to check
   * @return true if a valid currency
   */
  static bool isValidCurrency(String currency) {
    return currency != null && currenciesSupported.contains(currency);
  }

  static String currencySymbol(String currency) {
    return currencySymbols[currency] ?? currency;
  }
}
