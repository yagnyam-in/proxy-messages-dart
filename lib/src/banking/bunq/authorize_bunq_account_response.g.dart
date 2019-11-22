// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorize_bunq_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizeBunqAccountResponse _$AuthorizeBunqAccountResponseFromJson(Map json) {
  return AuthorizeBunqAccountResponse(
    request: AuthorizeBunqAccountRequest.signedMessageFromJson(
        json['request'] as Map),
    proxyAccounts:
        ProxyAccount.signedMessagesFromJson(json['proxyAccounts'] as List),
  );
}

Map<String, dynamic> _$AuthorizeBunqAccountResponseToJson(
        AuthorizeBunqAccountResponse instance) =>
    <String, dynamic>{
      'request': instance.request.toJson(),
      'proxyAccounts': instance.proxyAccounts.map((e) => e.toJson()).toList(),
    };
