// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escrow_account_proposal_payee_ack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EscrowAccountProposalPayeeAck _$EscrowAccountProposalPayeeAckFromJson(
    Map json) {
  return EscrowAccountProposalPayeeAck(
      payeeProxyId: ProxyId.fromJson(json['payeeProxyId'] as Map),
      escrowAccountProposal: EscrowAccountProposal.signedMessageFromJson(
          json['escrowAccountProposal'] as Map));
}

Map<String, dynamic> _$EscrowAccountProposalPayeeAckToJson(
        EscrowAccountProposalPayeeAck instance) =>
    <String, dynamic>{
      'payeeProxyId': instance.payeeProxyId.toJson(),
      'escrowAccountProposal': instance.escrowAccountProposal.toJson()
    };
