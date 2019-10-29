// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banking_service_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankingServiceProvider _$BankingServiceProviderFromJson(Map json) {
  return BankingServiceProvider(
    proxyId: ProxyId.fromJson(json['proxyId'] as Map),
    proxyUniverse: json['proxyUniverse'] as String,
    supportedCurrencies:
        (json['supportedCurrencies'] as List).map((e) => e as String).toList(),
    apiEndpoint: json['apiEndpoint'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$BankingServiceProviderToJson(
        BankingServiceProvider instance) =>
    <String, dynamic>{
      'proxyId': instance.proxyId.toJson(),
      'proxyUniverse': instance.proxyUniverse,
      'supportedCurrencies': instance.supportedCurrencies,
      'apiEndpoint': instance.apiEndpoint,
      'name': instance.name,
    };
