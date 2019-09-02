import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

import 'escrow_account_proposal.dart';

part 'escrow_account_proposal_payee_ack.g.dart';

@JsonSerializable()
class EscrowAccountProposalPayeeAck extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final ProxyId payeeProxyId;

  @JsonKey(nullable: false, fromJson: EscrowAccountProposal.signedMessageFromJson)
  final SignedMessage<EscrowAccountProposal> escrowAccountProposal;

  EscrowAccountProposalPayeeAck({
    @required this.payeeProxyId,
    @required this.escrowAccountProposal,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isValidProxyId(payeeProxyId) && isValidProxyObject(escrowAccountProposal);
  }

  @override
  void assertValid() {
    assertValidProxyId(payeeProxyId);
    assertValidProxyObject(escrowAccountProposal);
  }

  @override
  ProxyId getSigner() {
    return payeeProxyId;
  }

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [escrowAccountProposal];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.escrow.negotiation.EscrowAccountProposalPayeeAck";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$EscrowAccountProposalPayeeAckToJson(this);

  static EscrowAccountProposalPayeeAck fromJson(Map json) => _$EscrowAccountProposalPayeeAckFromJson(json);

  static SignedMessage<EscrowAccountProposalPayeeAck> signedMessageFromJson(Map json) {
    SignedMessage<EscrowAccountProposalPayeeAck> signedMessage =
        SignedMessage.fromJson<EscrowAccountProposalPayeeAck>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }
}
