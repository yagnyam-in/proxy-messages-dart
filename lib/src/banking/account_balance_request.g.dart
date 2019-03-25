// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_balance_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountBalanceRequest _$AccountBalanceRequestFromJson(
    Map<String, dynamic> json) {
  return AccountBalanceRequest(
      requestId: json['requestId'] as String,
      proxyAccount: ProxyAccount.signedMessageFromJson(
          json['proxyAccount'] as Map<String, dynamic>));
}

Map<String, dynamic> _$AccountBalanceRequestToJson(
        AccountBalanceRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'proxyAccount': instance.proxyAccount
    };
