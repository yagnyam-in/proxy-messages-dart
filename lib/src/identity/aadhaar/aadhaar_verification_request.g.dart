// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aadhaar_verification_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AadhaarVerificationRequest _$AadhaarVerificationRequestFromJson(Map json) {
  return AadhaarVerificationRequest(
    requestId: json['requestId'] as String,
    proxyUniverse: json['proxyUniverse'] as String,
    ownerProxyId: ProxyId.fromJson(json['ownerProxyId'] as Map),
    aadhaarNumber: json['aadhaarNumber'] as String,
    issuerProxyId: ProxyId.fromJson(json['issuerProxyId'] as Map),
  );
}

Map<String, dynamic> _$AadhaarVerificationRequestToJson(
        AadhaarVerificationRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'proxyUniverse': instance.proxyUniverse,
      'ownerProxyId': instance.ownerProxyId.toJson(),
      'aadhaarNumber': instance.aadhaarNumber,
      'issuerProxyId': instance.issuerProxyId.toJson(),
    };
