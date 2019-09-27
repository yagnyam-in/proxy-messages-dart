// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_sack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoneySack _$MoneySackFromJson(Map json) {
  return MoneySack(
    moneySackId: MoneySackId.fromJson(json['moneySackId'] as Map),
    ownerProxyId: ProxyId.fromJson(json['ownerProxyId'] as Map),
    creationDate: DateTime.parse(json['creationDate'] as String),
    expiryDate: DateTime.parse(json['expiryDate'] as String),
    balance: Amount.fromJson(json['balance'] as Map),
  );
}

Map<String, dynamic> _$MoneySackToJson(MoneySack instance) => <String, dynamic>{
      'moneySackId': instance.moneySackId.toJson(),
      'ownerProxyId': instance.ownerProxyId.toJson(),
      'creationDate': instance.creationDate.toIso8601String(),
      'expiryDate': instance.expiryDate.toIso8601String(),
      'balance': instance.balance.toJson(),
    };
