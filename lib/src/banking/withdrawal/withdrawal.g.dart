// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Withdrawal _$WithdrawalFromJson(Map json) {
  return Withdrawal(
      withdrawalId: json['withdrawalId'] as String,
      proxyAccount:
          ProxyAccount.signedMessageFromJson(json['proxyAccount'] as Map),
      amount: Amount.fromJson(json['amount'] as Map),
      destinationAccount:
          NonProxyAccount.fromJson(json['destinationAccount'] as Map));
}

Map<String, dynamic> _$WithdrawalToJson(Withdrawal instance) =>
    <String, dynamic>{
      'withdrawalId': instance.withdrawalId,
      'proxyAccount': instance.proxyAccount.toJson(),
      'amount': instance.amount.toJson(),
      'destinationAccount': instance.destinationAccount.toJson()
    };
