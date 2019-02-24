// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proxy_wallet_creation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProxyWalletCreationRequest _$ProxyWalletCreationRequestFromJson(
    Map<String, dynamic> json) {
  return ProxyWalletCreationRequest(
      requestId: json['requestId'] as String,
      proxyId: ProxyId.fromJson(json['proxyId'] as Map<String, dynamic>),
      bankId: ProxyId.fromJson(json['bankId'] as Map<String, dynamic>),
      currency: json['currency'] as String);
}

Map<String, dynamic> _$ProxyWalletCreationRequestToJson(
        ProxyWalletCreationRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'proxyId': instance.proxyId,
      'bankId': instance.bankId,
      'currency': instance.currency
    };
