import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

import 'escrow_account_proposal.dart';

part 'escrow_account_proposal_status.g.dart';

@JsonSerializable()
class EscrowAccountProposalStatus extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false, fromJson: EscrowAccountProposal.signedMessageFromJson)
  final SignedMessage<EscrowAccountProposal> escrowAccountProposal;

  @JsonKey(nullable: true)
  final ProxyId escrowProxyId;

  @JsonKey(nullable: true)
  final ProxyId payeeProxyId;

  EscrowAccountProposalStatus({
    @required this.escrowAccountProposal,
    @required this.escrowProxyId,
    @required this.payeeProxyId,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return assertValidProxyObject(escrowAccountProposal) &&
        (escrowProxyId == null || escrowProxyId.isValid()) &&
        (payeeProxyId == null || payeeProxyId.isValid());
  }

  @override
  void assertValid() {
    assertValidProxyObject(escrowAccountProposal);
    if (escrowProxyId != null) {
      escrowProxyId.assertValid();
    }
    if (payeeProxyId != null) {
      payeeProxyId.assertValid();
    }
  }

  @override
  ProxyId getSigner() {
    return escrowAccountProposal.message.bankProxyId;
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
  String get messageType => "in.yagnyam.proxy.messages.escrow.EscrowAccountProposalStatus";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$EscrowAccountProposalStatusToJson(this);

  static EscrowAccountProposalStatus fromJson(Map json) => _$EscrowAccountProposalStatusFromJson(json);

  static SignedMessage<EscrowAccountProposalStatus> signedMessageFromJson(Map json) {
    SignedMessage<EscrowAccountProposalStatus> signedMessage =
        SignedMessage.fromJson<EscrowAccountProposalStatus>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }
}
