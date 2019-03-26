// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Withdrawal _$WithdrawalFromJson(Map<String, dynamic> json) {
  return Withdrawal(
      withdrawalId: json['withdrawalId'] as String,
      proxyAccount: ProxyAccount.signedMessageFromJson(
          json['proxyAccount'] as Map<String, dynamic>),
      amount: Amount.fromJson(json['amount'] as Map<String, dynamic>),
      destinationAccount: NonProxyAccount.fromJson(
          json['destinationAccount'] as Map<String, dynamic>));
}

Map<String, dynamic> _$WithdrawalToJson(Withdrawal instance) =>
    <String, dynamic>{
      'withdrawalId': instance.withdrawalId,
      'proxyAccount': instance.proxyAccount,
      'amount': instance.amount,
      'destinationAccount': instance.destinationAccount
    };
