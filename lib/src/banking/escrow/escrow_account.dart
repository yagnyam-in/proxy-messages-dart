import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';

import 'escrow_account_id.dart';

part 'escrow_account.g.dart';

enum EscrowAccountStatusEnum {
  Ready,
  Completed,
  Cancelled,
}

@JsonSerializable()
class EscrowAccount extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final EscrowAccountId escrowAccountId;

  @JsonKey(nullable: false)
  final ProxyId payerProxyId;

  @JsonKey(nullable: false)
  final ProxyId payeeProxyId;

  @JsonKey(nullable: false)
  final ProxyId escrowProxyId;

  @JsonKey(nullable: false)
  final DateTime creationDate;

  @JsonKey(nullable: false)
  final DateTime expiryDate;

  @JsonKey(nullable: false)
  final Amount balance;

  @JsonKey(nullable: false)
  final String title;

  @JsonKey(nullable: true)
  final String description;

  EscrowAccount({
    @required this.escrowAccountId,
    @required this.payerProxyId,
    @required this.payeeProxyId,
    @required this.escrowProxyId,
    @required this.creationDate,
    @required this.expiryDate,
    @required this.balance,
    @required this.title,
    @required this.description,
  }) {
    assertValid();
  }

  @override
  ProxyId getSigner() {
    return escrowAccountId.bankProxyId;
  }

  @override
  String toReadableString() {
    return null;
  }

  @override
  bool isValid() {
    return isValidProxyId(payerProxyId) &&
        isValidProxyId(escrowProxyId) &&
        isValidProxyId(payeeProxyId) &&
        isValidDateTime(creationDate) &&
        isValidDateTime(expiryDate) &&
        isValidProxyObject(balance) &&
        isNotEmpty(title);
  }

  @override
  void assertValid() {
    assertValidProxyObject(escrowAccountId);
    assertValidProxyId(payerProxyId);
    assertValidProxyId(escrowProxyId);
    assertValidProxyId(payeeProxyId);
    assertValidDateTime(creationDate);
    assertValidDateTime(expiryDate);
    assertValidProxyObject(balance);
    assertNotEmpty(title);
  }

  static EscrowAccount fromJson(Map json) => _$EscrowAccountFromJson(json);

  static SignedMessage<EscrowAccount> signedMessageFromJson(Map json) {
    SignedMessage<EscrowAccount> signedMessage = SignedMessage.fromJson<EscrowAccount>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$EscrowAccountToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.escrow.EscrowAccount";

  ProxyId get bankProxyId => escrowAccountId.bankProxyId;

  String get proxyUniverse => escrowAccountId.proxyUniverse;
}
