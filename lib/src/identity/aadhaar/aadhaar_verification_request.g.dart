// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aadhaar_verification_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AadhaarVerificationRequest _$AadhaarVerificationRequestFromJson(Map json) {
  return AadhaarVerificationRequest(
    requestId: json['requestId'] as String,
    ownerProxyId: ProxyId.fromJson(json['ownerProxyId'] as Map),
    aadhaarNumber: json['aadhaarNumber'] as String,
    identityProviderProxyId:
        ProxyId.fromJson(json['identityProviderProxyId'] as Map),
  );
}

Map<String, dynamic> _$AadhaarVerificationRequestToJson(
        AadhaarVerificationRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'ownerProxyId': instance.ownerProxyId.toJson(),
      'aadhaarNumber': instance.aadhaarNumber,
      'identityProviderProxyId': instance.identityProviderProxyId.toJson(),
    };
