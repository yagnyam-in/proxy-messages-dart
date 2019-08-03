// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_balance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountBalanceResponse _$AccountBalanceResponseFromJson(Map json) {
  return AccountBalanceResponse(
      request:
          AccountBalanceRequest.signedMessageFromJson(json['request'] as Map),
      balance: Amount.fromJson(json['balance'] as Map));
}

Map<String, dynamic> _$AccountBalanceResponseToJson(
        AccountBalanceResponse instance) =>
    <String, dynamic>{
      'request': instance.request.toJson(),
      'balance': instance.balance.toJson()
    };
