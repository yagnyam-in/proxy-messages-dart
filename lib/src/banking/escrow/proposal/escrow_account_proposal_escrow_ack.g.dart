// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escrow_account_proposal_escrow_ack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EscrowAccountProposalEscrowAck _$EscrowAccountProposalEscrowAckFromJson(
    Map json) {
  return EscrowAccountProposalEscrowAck(
    escrowProxyId: ProxyId.fromJson(json['escrowProxyId'] as Map),
    escrowAccountProposal: EscrowAccountProposal.signedMessageFromJson(
        json['escrowAccountProposal'] as Map),
  );
}

Map<String, dynamic> _$EscrowAccountProposalEscrowAckToJson(
        EscrowAccountProposalEscrowAck instance) =>
    <String, dynamic>{
      'escrowProxyId': instance.escrowProxyId.toJson(),
      'escrowAccountProposal': instance.escrowAccountProposal.toJson(),
    };
