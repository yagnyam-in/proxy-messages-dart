// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_number_authorization_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneNumberAuthorizationRequest _$PhoneNumberAuthorizationRequestFromJson(
    Map json) {
  return PhoneNumberAuthorizationRequest(
    requesterProxyId: ProxyId.fromJson(json['requesterProxyId'] as Map),
    authorizerProxyId: ProxyId.fromJson(json['authorizerProxyId'] as Map),
    phoneNumber: json['phoneNumber'] as String,
    authorizationId: json['authorizationId'] as String,
  );
}

Map<String, dynamic> _$PhoneNumberAuthorizationRequestToJson(
        PhoneNumberAuthorizationRequest instance) =>
    <String, dynamic>{
      'requesterProxyId': instance.requesterProxyId.toJson(),
      'phoneNumber': instance.phoneNumber,
      'authorizerProxyId': instance.authorizerProxyId.toJson(),
      'authorizationId': instance.authorizationId,
    };
