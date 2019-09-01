import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/escrow/escrow_account.dart';

import 'escrow_account_id.dart';

part 'escrow_account_details_request.g.dart';

@JsonSerializable()
class EscrowAccountDetailsRequest extends SignableRequestMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final String requestId;

  @JsonKey(nullable: false, fromJson: EscrowAccount.signedMessageFromJson)
  final SignedMessage<EscrowAccount> escrowAccount;

  EscrowAccountDetailsRequest({
    @required this.requestId,
    @required this.escrowAccount,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isValidProxyObject(escrowAccount);
  }

  @override
  void assertValid() {
    assertValidProxyObject(escrowAccount);
  }

  @override
  ProxyId getSigner() {
    throw UnimplementedError("`validSigners` is implemented. This method should never be invoked");
  }

  @override
  Set<ProxyId> getValidSigners() {
    return {
      escrowAccount.message.escrowProxyId,
      escrowAccount.message.payerProxyId,
      escrowAccount.message.payeeProxyId,
    };
  }

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [escrowAccount];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.escrow.EscrowAccountDetailsRequest";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$EscrowAccountDetailsRequestToJson(this);

  static EscrowAccountDetailsRequest fromJson(Map json) => _$EscrowAccountDetailsRequestFromJson(json);

  static SignedMessage<EscrowAccountDetailsRequest> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<EscrowAccountDetailsRequest> signedMessage =
        SignedMessage.fromJson<EscrowAccountDetailsRequest>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  EscrowAccountId get escrowAccountId => escrowAccount.message.escrowAccountId;

  ProxyId get bankProxyId => escrowAccount.message.bankProxyId;
}
