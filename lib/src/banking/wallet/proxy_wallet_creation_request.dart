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
   * Proxy Universe
   */
  @JsonKey(nullable: false)
  final String proxyUniverse;

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
    @required this.proxyUniverse,
    @required this.proxyId,
    @required this.bankId,
    @required this.currency,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isNotEmpty(requestId) &&
        isNotEmpty(proxyUniverse) &&
        isValidProxyId(proxyId) &&
        isValidProxyId(bankId) &&
        Currency.isValidCurrency(currency);
  }

  @override
  void assertValid() {
    assert(isNotEmpty(requestId));
    assert(isNotEmpty(proxyUniverse));
    proxyId.assertValid();
    bankId.assertValid();
    assert(Currency.isValidCurrency(currency));
  }

  @override
  ProxyId getSigner() {
    return proxyId;
  }

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.banking.wallet.ProxyWalletCreationRequest";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$ProxyWalletCreationRequestToJson(this);

  static ProxyWalletCreationRequest fromJson(Map json) => _$ProxyWalletCreationRequestFromJson(json);

  static SignedMessage<ProxyWalletCreationRequest> signedMessageFromJson(Map json) {
    SignedMessage<ProxyWalletCreationRequest> signedMessage = SignedMessage.fromJson<ProxyWalletCreationRequest>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }
}
