// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proxy_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProxyAccount _$ProxyAccountFromJson(Map json) {
  return ProxyAccount(
      proxyAccountId: ProxyAccountId.fromJson(json['proxyAccountId'] as Map),
      ownerProxyId: ProxyId.fromJson(json['ownerProxyId'] as Map),
      currency: json['currency'] as String,
      creationDate: DateTime.parse(json['creationDate'] as String),
      expiryDate: DateTime.parse(json['expiryDate'] as String),
      maximumAmountPerTransaction:
          Amount.fromJson(json['maximumAmountPerTransaction'] as Map));
}

Map<String, dynamic> _$ProxyAccountToJson(ProxyAccount instance) =>
    <String, dynamic>{
      'proxyAccountId': instance.proxyAccountId.toJson(),
      'ownerProxyId': instance.ownerProxyId.toJson(),
      'creationDate': instance.creationDate.toIso8601String(),
      'expiryDate': instance.expiryDate.toIso8601String(),
      'currency': instance.currency,
      'maximumAmountPerTransaction':
          instance.maximumAmountPerTransaction.toJson()
    };
