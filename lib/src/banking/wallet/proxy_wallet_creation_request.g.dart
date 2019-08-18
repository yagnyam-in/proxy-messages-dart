// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proxy_wallet_creation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProxyWalletCreationRequest _$ProxyWalletCreationRequestFromJson(Map json) {
  return ProxyWalletCreationRequest(
    requestId: json['requestId'] as String,
    proxyUniverse: json['proxyUniverse'] as String,
    ownerProxyId: ProxyId.fromJson(json['ownerProxyId'] as Map),
    bankProxyId: ProxyId.fromJson(json['bankProxyId'] as Map),
    currency: json['currency'] as String,
  );
}

Map<String, dynamic> _$ProxyWalletCreationRequestToJson(
        ProxyWalletCreationRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'proxyUniverse': instance.proxyUniverse,
      'ownerProxyId': instance.ownerProxyId.toJson(),
      'bankProxyId': instance.bankProxyId.toJson(),
      'currency': instance.currency,
    };
