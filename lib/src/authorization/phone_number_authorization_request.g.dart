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
    index: json['index'] as String,
  );
}

Map<String, dynamic> _$PhoneNumberAuthorizationRequestToJson(
    PhoneNumberAuthorizationRequest instance) {
  final val = <String, dynamic>{
    'requesterProxyId': instance.requesterProxyId.toJson(),
    'phoneNumber': instance.phoneNumber,
    'authorizerProxyId': instance.authorizerProxyId.toJson(),
    'authorizationId': instance.authorizationId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('index', instance.index);
  return val;
}
