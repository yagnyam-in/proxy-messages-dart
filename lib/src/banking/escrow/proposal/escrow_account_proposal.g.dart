// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escrow_account_proposal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EscrowAccountProposal _$EscrowAccountProposalFromJson(Map json) {
  return EscrowAccountProposal(
    proposalId: json['proposalId'] as String,
    proxyUniverse: json['proxyUniverse'] as String,
    payerProxyId: ProxyId.fromJson(json['payerProxyId'] as Map),
    bankProxyId: ProxyId.fromJson(json['bankProxyId'] as Map),
    amount: Amount.fromJson(json['amount'] as Map),
    title: json['title'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$EscrowAccountProposalToJson(
    EscrowAccountProposal instance) {
  final val = <String, dynamic>{
    'proposalId': instance.proposalId,
    'proxyUniverse': instance.proxyUniverse,
    'payerProxyId': instance.payerProxyId.toJson(),
    'bankProxyId': instance.bankProxyId.toJson(),
    'amount': instance.amount.toJson(),
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  return val;
}
