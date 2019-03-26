import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/currency.dart';

part 'non_proxy_account.g.dart';

@JsonSerializable()
class NonProxyAccount extends ProxyBaseObject with ProxyUtils {
  /**
   * Bank Name
   */
  @JsonKey(nullable: false)
  final String bank;

  /**
   * Account Number
   */
  @JsonKey(nullable: false)
  final String accountNumber;

  /**
   * Account Holder Name
   */
  @JsonKey(nullable: false)
  final String accountHolder;

  /**
   * Currency
   */
  @JsonKey(nullable: false)
  final String currency;

  /**
   * IFSC Code of the Account. Only applicable in India
   */
  @JsonKey(includeIfNull: false)
  final String ifscCode;

  NonProxyAccount({
    @required this.bank,
    @required this.accountNumber,
    @required this.accountHolder,
    @required this.currency,
    this.ifscCode,
  });

  @override
  void assertValid() {
    assert(bank != null);
    assert(isNotEmpty(bank));
    assert(accountNumber != null);
    assert(isNotEmpty(accountNumber));
    assert(accountHolder != null);
    assert(isNotEmpty(accountHolder));
    assert(currency != null);
    assert(Currency.isValidCurrency(currency));
    assert(ifscCode == null || isNotEmpty(bank));
  }

  @override
  bool isValid() {
    return bank != null &&
        isNotEmpty(bank) &&
        accountNumber != null &&
        isNotEmpty(accountNumber) &&
        accountHolder != null &&
        isNotEmpty(accountHolder) &&
        currency != null &&
        Currency.isValidCurrency(currency) &&
        (ifscCode == null || isNotEmpty(ifscCode));
  }

  Map<String, dynamic> toJson() => _$NonProxyAccountToJson(this);

  factory NonProxyAccount.fromJson(Map<String, dynamic> json) =>
      _$NonProxyAccountFromJson(json);
}
