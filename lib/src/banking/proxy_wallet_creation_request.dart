import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';

part 'proxy_wallet_creation_request.g.dart';

@JsonSerializable()
class ProxyWalletCreationRequest extends SignableRequestMessage with ProxyUtils {
  /**
   * Unique Request Id. No two requests shall have same request number
   */
  @JsonKey(nullable: false)
  final String requestId;

  /**
   * Proxy Id
   */
  @JsonKey(nullable: false)
  final ProxyId proxyId;

  /**
   * Bank Id
   */
  @JsonKey(nullable: false)
  final ProxyId bankId;

  /**
   * Account Currency
   */
  @JsonKey(nullable: false)
  final String currency;

  ProxyWalletCreationRequest({
    @required this.requestId,
    @required this.proxyId,
    @required this.bankId,
    @required this.currency,
  })  : assert(isNotEmpty(requestId)),
        assert(isValidProxyId(proxyId)),
        assert(isValidProxyId(bankId)),
        assert(Currency.isValidCurrency(currency));

  @override
  bool isValid() {
    return isNotEmpty(requestId) &&
        isValidProxyId(proxyId) &&
        isValidProxyId(bankId) &&
        Currency.isValidCurrency(currency);
  }

  @override
  ProxyId getSigner() {
    return proxyId;
  }

  @override
  List<SignedMessage<SignableMessage>> getChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.banking.ProxyWalletCreationRequest";

  @override
  String toReadableString() {
    return null;
  }

  factory ProxyWalletCreationRequest.fromJson(Map<String, dynamic> json) => _$ProxyWalletCreationRequestFromJson(json);

  static ProxyWalletCreationRequest staticFromJson(Map<String, dynamic> json) => ProxyWalletCreationRequest.fromJson(json);

  Map<String, dynamic> toJson() => _$ProxyWalletCreationRequestToJson(this);
}
