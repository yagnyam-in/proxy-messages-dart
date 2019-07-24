// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escrow_account_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EscrowAccountId _$EscrowAccountIdFromJson(Map json) {
  return EscrowAccountId(
      accountId: json['accountId'] as String,
      bankId: json['bankId'] as String,
      proxyUniverse: json['proxyUniverse'] as String);
}

Map<String, dynamic> _$EscrowAccountIdToJson(EscrowAccountId instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'bankId': instance.bankId,
      'proxyUniverse': instance.proxyUniverse
    };
