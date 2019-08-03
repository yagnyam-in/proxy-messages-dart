// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escrow_account_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EscrowAccountId _$EscrowAccountIdFromJson(Map json) {
  return EscrowAccountId(
      accountId: json['accountId'] as String,
      bankProxyId: ProxyId.fromJson(json['bankProxyId'] as Map),
      proxyUniverse: json['proxyUniverse'] as String);
}

Map<String, dynamic> _$EscrowAccountIdToJson(EscrowAccountId instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'bankProxyId': instance.bankProxyId.toJson(),
      'proxyUniverse': instance.proxyUniverse
    };
