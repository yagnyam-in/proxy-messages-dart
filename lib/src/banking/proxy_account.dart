import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';

part 'proxy_account.g.dart';

enum ProxyAccountPermissionEnum {
  InquireAccountDetails,
  InquireBalance,
  AuthorizeProxy,
  MakePayment,
}

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

  @JsonKey(nullable: true)
  final List<ProxyAccountPermissionEnum> permissions;

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
    @required this.permissions,
    @required this.maximumAmountPerTransaction,
  }) {
    assertValid();
  }

  @override
  ProxyId getSigner() {
    return proxyAccountId.bankProxyId;
  }

  @override
  String toReadableString() {
    return null;
  }

  @override
  bool isValid() {
    return isValidProxyObject(proxyAccountId) &&
        isValidProxyId(ownerProxyId) &&
        isValidDateTime(creationDate) &&
        isValidDateTime(expiryDate) &&
        Currency.isValidCurrency(currency) &&
        isValidProxyObject(maximumAmountPerTransaction);
  }

  @override
  void assertValid() {
    assertValidProxyObject(proxyAccountId);
    assertValidProxyId(ownerProxyId);
    assertValidDateTime(creationDate);
    assertValidDateTime(expiryDate);
    assert(Currency.isValidCurrency(currency));
    assertValidProxyObject(maximumAmountPerTransaction);
  }

  static ProxyAccount fromJson(Map json) => _$ProxyAccountFromJson(json);

  static SignedMessage<ProxyAccount> signedMessageFromJson(Map json) {
    if (json == null) return null;
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

  ProxyId get bankProxyId => proxyAccountId.bankProxyId;
}
