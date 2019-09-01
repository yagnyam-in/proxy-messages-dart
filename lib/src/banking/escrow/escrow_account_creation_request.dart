import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';

import 'escrow_account_id.dart';

part 'escrow_account_creation_request.g.dart';

@JsonSerializable()
class EscrowAccountCreationRequest extends SignableRequestMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final String escrowNegotiationId;

  @JsonKey(nullable: true)
  final ProxyId escrowProxyId;

  @JsonKey(nullable: true)
  final ProxyId payeeProxyId;

  @JsonKey(nullable: false)
  final SignedMessage<ProxyAccount> debitProxyAccount;

  @JsonKey(nullable: false)
  final Amount amount;

  @JsonKey(nullable: false)
  final String title;

  final String description;

  EscrowAccountCreationRequest({
    @required this.escrowNegotiationId,
    @required this.escrowProxyId,
    @required this.payeeProxyId,
    @required this.debitProxyAccount,
    @required this.amount,
    @required this.title,
    @required this.description,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isNotEmpty(escrowNegotiationId) &&
        isValidProxyId(escrowProxyId) &&
        isValidProxyId(payeeProxyId) &&
        isValidProxyObject(debitProxyAccount) &&
        isValidProxyObject(amount) &&
        isNotEmpty(title);
  }

  @override
  void assertValid() {
    assertNotEmpty(escrowNegotiationId);
    assertValidProxyId(escrowProxyId);
    assertValidProxyId(payeeProxyId);
    assertValidProxyObject(debitProxyAccount);
    assertValidProxyObject(amount);
    assertNotEmpty(title);
  }

  @override
  ProxyId getSigner() {
    return payerProxyId;
  }

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [debitProxyAccount];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.escrow.EscrowAccountCreationRequest";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$EscrowAccountCreationRequestToJson(this);

  static EscrowAccountCreationRequest fromJson(Map json) => _$EscrowAccountCreationRequestFromJson(json);

  static SignedMessage<EscrowAccountCreationRequest> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<EscrowAccountCreationRequest> signedMessage =
        SignedMessage.fromJson<EscrowAccountCreationRequest>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  ProxyId get payerProxyId => debitProxyAccount.message.ownerProxyId;

  ProxyId get bankProxyId => debitProxyAccount.message.ownerProxyId;

  String get proxyUniverse => debitProxyAccount.message.proxyUniverse;

  ProxyAccountId get debitProxyAccountId => debitProxyAccount.message.proxyAccountId;

  @override
  String get requestId => escrowNegotiationId;
}
