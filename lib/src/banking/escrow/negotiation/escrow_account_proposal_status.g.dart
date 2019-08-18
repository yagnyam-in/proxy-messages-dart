// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escrow_account_proposal_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EscrowAccountProposalStatus _$EscrowAccountProposalStatusFromJson(Map json) {
  return EscrowAccountProposalStatus(
    escrowAccountProposal: EscrowAccountProposal.signedMessageFromJson(
        json['escrowAccountProposal'] as Map),
    escrowProxyId: json['escrowProxyId'] == null
        ? null
        : ProxyId.fromJson(json['escrowProxyId'] as Map),
    payeeProxyId: json['payeeProxyId'] == null
        ? null
        : ProxyId.fromJson(json['payeeProxyId'] as Map),
  );
}

Map<String, dynamic> _$EscrowAccountProposalStatusToJson(
    EscrowAccountProposalStatus instance) {
  final val = <String, dynamic>{
    'escrowAccountProposal': instance.escrowAccountProposal.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('escrowProxyId', instance.escrowProxyId?.toJson());
  writeNotNull('payeeProxyId', instance.payeeProxyId?.toJson());
  return val;
}
