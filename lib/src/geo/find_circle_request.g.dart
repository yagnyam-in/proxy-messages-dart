// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_circle_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindCircleRequest _$FindCircleRequestFromJson(Map json) {
  return FindCircleRequest(
    requestId: json['requestId'] as String,
    serviceProviderProxyId:
        ProxyId.fromJson(json['serviceProviderProxyId'] as Map),
    geoLocation: GeoPoint.fromJson(json['geoLocation'] as Map),
    requesterProxyId: ProxyId.fromJson(json['requesterProxyId'] as Map),
  );
}

Map<String, dynamic> _$FindCircleRequestToJson(FindCircleRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'serviceProviderProxyId': instance.serviceProviderProxyId.toJson(),
      'geoLocation': instance.geoLocation.toJson(),
      'requesterProxyId': instance.requesterProxyId.toJson(),
    };
