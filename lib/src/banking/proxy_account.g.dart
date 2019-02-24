// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proxy_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProxyAccount _$ProxyAccountFromJson(Map<String, dynamic> json) {
  return ProxyAccount(
      proxyAccountId: ProxyAccountId.fromJson(
          json['proxyAccountId'] as Map<String, dynamic>),
      proxyId: ProxyId.fromJson(json['proxyId'] as Map<String, dynamic>),
      currency: json['currency'] as String,
      creationDate: DateTime.parse(json['creationDate'] as String),
      expiryDate: DateTime.parse(json['expiryDate'] as String),
      maximumAmountPerTransaction: Amount.fromJson(
          json['maximumAmountPerTransaction'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ProxyAccountToJson(ProxyAccount instance) =>
    <String, dynamic>{
      'proxyAccountId': instance.proxyAccountId,
      'proxyId': instance.proxyId,
      'creationDate': instance.creationDate.toIso8601String(),
      'expiryDate': instance.expiryDate.toIso8601String(),
      'currency': instance.currency,
      'maximumAmountPerTransaction': instance.maximumAmountPerTransaction
    };
