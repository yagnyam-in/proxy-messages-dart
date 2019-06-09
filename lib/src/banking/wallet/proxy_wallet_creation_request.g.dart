// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proxy_wallet_creation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProxyWalletCreationRequest _$ProxyWalletCreationRequestFromJson(Map json) {
  return ProxyWalletCreationRequest(
      requestId: json['requestId'] as String,
      proxyUniverse: json['proxyUniverse'] as String,
      proxyId: ProxyId.fromJson(json['proxyId'] as Map),
      bankId: ProxyId.fromJson(json['bankId'] as Map),
      currency: json['currency'] as String);
}

Map<String, dynamic> _$ProxyWalletCreationRequestToJson(
        ProxyWalletCreationRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'proxyUniverse': instance.proxyUniverse,
      'proxyId': instance.proxyId.toJson(),
      'bankId': instance.bankId.toJson(),
      'currency': instance.currency
    };
