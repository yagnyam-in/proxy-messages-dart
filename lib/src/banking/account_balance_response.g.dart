// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_balance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountBalanceResponse _$AccountBalanceResponseFromJson(
    Map<String, dynamic> json) {
  return AccountBalanceResponse(
      request: AccountBalanceRequest.signedMessageFromJson(
          json['request'] as Map<String, dynamic>),
      balance: Amount.fromJson(json['balance'] as Map<String, dynamic>));
}

Map<String, dynamic> _$AccountBalanceResponseToJson(
        AccountBalanceResponse instance) =>
    <String, dynamic>{'request': instance.request, 'balance': instance.balance};
