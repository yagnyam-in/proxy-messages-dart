// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proxy_account_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProxyAccountId _$ProxyAccountIdFromJson(Map<String, dynamic> json) {
  return ProxyAccountId(json['accountId'] as String, json['bankId'] as String);
}

Map<String, dynamic> _$ProxyAccountIdToJson(ProxyAccountId instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'bankId': instance.bankId
    };
