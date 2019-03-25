// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proxy_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProxyAccount _$ProxyAccountFromJson(Map<String, dynamic> json) {
  return ProxyAccount(
      proxyAccountId: ProxyAccountId.fromJson(
          json['proxyAccountId'] as Map<String, dynamic>),
      ownerProxyId:
          ProxyId.fromJson(json['ownerProxyId'] as Map<String, dynamic>),
      currency: json['currency'] as String,
      creationDate: DateTime.parse(json['creationDate'] as String),
      expiryDate: DateTime.parse(json['expiryDate'] as String),
      maximumAmountPerTransaction: Amount.fromJson(
          json['maximumAmountPerTransaction'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ProxyAccountToJson(ProxyAccount instance) =>
    <String, dynamic>{
      'proxyAccountId': instance.proxyAccountId,
      'ownerProxyId': instance.ownerProxyId,
      'creationDate': instance.creationDate.toIso8601String(),
      'expiryDate': instance.expiryDate.toIso8601String(),
      'currency': instance.currency,
      'maximumAmountPerTransaction': instance.maximumAmountPerTransaction
    };
