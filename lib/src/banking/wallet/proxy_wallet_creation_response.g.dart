// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proxy_wallet_creation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProxyWalletCreationResponse _$ProxyWalletCreationResponseFromJson(Map json) {
  return ProxyWalletCreationResponse(
    request: ProxyWalletCreationRequest.signedMessageFromJson(
        json['request'] as Map),
    proxyAccount:
        ProxyAccount.signedMessageFromJson(json['proxyAccount'] as Map),
  );
}

Map<String, dynamic> _$ProxyWalletCreationResponseToJson(
        ProxyWalletCreationResponse instance) =>
    <String, dynamic>{
      'request': instance.request.toJson(),
      'proxyAccount': instance.proxyAccount.toJson(),
    };
