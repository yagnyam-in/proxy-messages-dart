// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proxy_account_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProxyAccountId _$ProxyAccountIdFromJson(Map json) {
  return ProxyAccountId(
      accountId: json['accountId'] as String,
      bankProxyId: ProxyId.fromJson(json['bankProxyId'] as Map),
      proxyUniverse: json['proxyUniverse'] as String);
}

Map<String, dynamic> _$ProxyAccountIdToJson(ProxyAccountId instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'bankProxyId': instance.bankProxyId.toJson(),
      'proxyUniverse': instance.proxyUniverse
    };
