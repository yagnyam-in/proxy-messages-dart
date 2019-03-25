import 'package:json_annotation/json_annotation.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';

part 'amount.g.dart';

@JsonSerializable()
class Amount extends ProxyBaseObject with ProxyUtils {
  @JsonKey(nullable: false)
  final String currency;

  @JsonKey(nullable: false)
  final double value;

  Amount(this.currency, this.value)
      : assert(Currency.isValidCurrency(currency)),
        assert(value != null);

  @override
  bool isValid() {
    return Currency.isValidCurrency(currency) && value != null;
  }

  @override
  void assertValid() {
    assert(Currency.isValidCurrency(currency));
    assert(value != null);
  }

  @override
  String toString() {
    return "$currency $value";
  }

  Amount add(Amount amount) {
    if (currency != amount.currency) {
      throw ArgumentError("Currencies " + currency + ", " + amount.currency + " are not same");
    }
    return Amount(currency, value + amount.value);
  }

  Amount subtract(Amount amount) {
    if (currency != amount.currency) {
      throw ArgumentError("Currencies " + currency + ", " + amount.currency + " are not same");
    }
    return Amount(currency, value - amount.value);
  }

  factory Amount.fromJson(Map<String, dynamic> json) => _$AmountFromJson(json);

  Map<String, dynamic> toJson() => _$AmountToJson(this);
}
