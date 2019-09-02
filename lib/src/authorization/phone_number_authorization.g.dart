// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_number_authorization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneNumberAuthorization _$PhoneNumberAuthorizationFromJson(Map json) {
  return PhoneNumberAuthorization(
    authorizedProxyId: ProxyId.fromJson(json['authorizedProxyId'] as Map),
    authorizerProxyId: ProxyId.fromJson(json['authorizerProxyId'] as Map),
    phoneNumber: json['phoneNumber'] as String,
    validFrom: DateTime.parse(json['validFrom'] as String),
    validTill: DateTime.parse(json['validTill'] as String),
  );
}

Map<String, dynamic> _$PhoneNumberAuthorizationToJson(
        PhoneNumberAuthorization instance) =>
    <String, dynamic>{
      'authorizedProxyId': instance.authorizedProxyId.toJson(),
      'phoneNumber': instance.phoneNumber,
      'authorizerProxyId': instance.authorizerProxyId.toJson(),
      'validFrom': instance.validFrom.toIso8601String(),
      'validTill': instance.validTill.toIso8601String(),
    };
