// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_money_sack_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateMoneySackRequest _$CreateMoneySackRequestFromJson(Map json) {
  return CreateMoneySackRequest(
    requestId: json['requestId'] as String,
    debitProxyAccount:
        ProxyAccount.signedMessageFromJson(json['debitProxyAccount'] as Map),
    amount: Amount.fromJson(json['amount'] as Map),
  );
}

Map<String, dynamic> _$CreateMoneySackRequestToJson(
        CreateMoneySackRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'debitProxyAccount': instance.debitProxyAccount.toJson(),
      'amount': instance.amount.toJson(),
    };
