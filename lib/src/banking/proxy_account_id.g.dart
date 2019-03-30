// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proxy_account_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProxyAccountId _$ProxyAccountIdFromJson(Map<String, dynamic> json) {
  return ProxyAccountId(
      accountId: json['accountId'] as String,
      bankId: json['bankId'] as String,
      proxyUniverse: json['proxyUniverse'] as String);
}

Map<String, dynamic> _$ProxyAccountIdToJson(ProxyAccountId instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'bankId': instance.bankId,
      'proxyUniverse': instance.proxyUniverse
    };
