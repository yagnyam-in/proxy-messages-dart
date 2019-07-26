import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';

part 'proxy_account.g.dart';

@JsonSerializable()
class ProxyAccount extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final ProxyAccountId proxyAccountId;

  @JsonKey(nullable: false)
  final ProxyId ownerProxyId;

  @JsonKey(nullable: false)
  final DateTime creationDate;

  @JsonKey(nullable: false)
  final DateTime expiryDate;

  @JsonKey(nullable: false)
  final String currency;

  /**
   * Maximum amount for which *each* Payment can be made
   */
  @JsonKey(nullable: false)
  final Amount maximumAmountPerTransaction;

  ProxyAccount({
    @required this.proxyAccountId,
    @required this.ownerProxyId,
    @required this.currency,
    @required this.creationDate,
    @required this.expiryDate,
    @required this.maximumAmountPerTransaction,
  }) {
    assertValid();
  }

  @override
  ProxyId getSigner() {
    return ProxyId(proxyAccountId.bankId);
  }

  @override
  String toReadableString() {
    return null;
  }

  @override
  bool isValid() {
    return proxyAccountId != null &&
        proxyAccountId.isValid() &&
        ownerProxyId != null &&
        ownerProxyId.isValid() &&
        isValidDateTime(creationDate) &&
        isValidDateTime(expiryDate) &&
        Currency.isValidCurrency(currency) &&
        maximumAmountPerTransaction != null &&
        maximumAmountPerTransaction.isValid();
  }

  @override
  void assertValid() {
    assert(proxyAccountId != null);
    proxyAccountId.assertValid();
    assert(ownerProxyId != null);
    ownerProxyId.assertValid();
    assert(isValidDateTime(creationDate));
    assert(isValidDateTime(expiryDate));
    assert(Currency.isValidCurrency(currency));
    assert(maximumAmountPerTransaction != null);
    maximumAmountPerTransaction.assertValid();
  }

  static ProxyAccount fromJson(Map json) => _$ProxyAccountFromJson(json);

  static SignedMessage<ProxyAccount> signedMessageFromJson(Map json) {
    SignedMessage<ProxyAccount> signedMessage = SignedMessage.fromJson<ProxyAccount>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$ProxyAccountToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.banking.ProxyAccount";

  String get bankId => proxyAccountId.bankId;

  String get proxyUniverse => proxyAccountId.proxyUniverse;
}
