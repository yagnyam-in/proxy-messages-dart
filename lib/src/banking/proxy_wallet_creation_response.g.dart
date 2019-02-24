// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proxy_wallet_creation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProxyWalletCreationResponse _$ProxyWalletCreationResponseFromJson(
    Map<String, dynamic> json) {
  return ProxyWalletCreationResponse(
      request: SignedMessage.fromJson(json['request'] as Map<String, dynamic>),
      proxyAccount:
          SignedMessage.fromJson(json['proxyAccount'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ProxyWalletCreationResponseToJson(
        ProxyWalletCreationResponse instance) =>
    <String, dynamic>{
      'request': instance.request,
      'proxyAccount': instance.proxyAccount
    };
