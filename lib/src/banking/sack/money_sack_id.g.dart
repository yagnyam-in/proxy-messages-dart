// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_sack_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoneySackId _$MoneySackIdFromJson(Map json) {
  return MoneySackId(
    id: json['id'] as String,
    sackProviderProxyId: ProxyId.fromJson(json['sackProviderProxyId'] as Map),
    proxyUniverse: json['proxyUniverse'] as String,
  );
}

Map<String, dynamic> _$MoneySackIdToJson(MoneySackId instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sackProviderProxyId': instance.sackProviderProxyId.toJson(),
      'proxyUniverse': instance.proxyUniverse,
    };
