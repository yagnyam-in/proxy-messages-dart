import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

import 'escrow_account_proposal.dart';

part 'escrow_account_proposal_escrow_ack.g.dart';

@JsonSerializable()
class EscrowAccountProposalEscrowAck extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final ProxyId escrowProxyId;

  @JsonKey(nullable: false, fromJson: EscrowAccountProposal.signedMessageFromJson)
  final SignedMessage<EscrowAccountProposal> escrowAccountProposal;

  EscrowAccountProposalEscrowAck({
    @required this.escrowProxyId,
    @required this.escrowAccountProposal,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isValidProxyId(escrowProxyId) && isValidProxyObject(escrowAccountProposal);
  }

  @override
  void assertValid() {
    assertValidProxyId(escrowProxyId);
    assertValidProxyObject(escrowAccountProposal);
  }

  @override
  ProxyId getSigner() {
    return escrowProxyId;
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
  String get messageType => "in.yagnyam.proxy.messages.escrow.negotiation.EscrowAccountProposalEscrowAck";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$EscrowAccountProposalEscrowAckToJson(this);

  static EscrowAccountProposalEscrowAck fromJson(Map json) => _$EscrowAccountProposalEscrowAckFromJson(json);

  static SignedMessage<EscrowAccountProposalEscrowAck> signedMessageFromJson(Map json) {
    SignedMessage<EscrowAccountProposalEscrowAck> signedMessage =
        SignedMessage.fromJson<EscrowAccountProposalEscrowAck>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }
}
