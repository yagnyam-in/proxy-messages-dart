// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_authorization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailAuthorization _$EmailAuthorizationFromJson(Map json) {
  return EmailAuthorization(
    authorizedProxyId: ProxyId.fromJson(json['authorizedProxyId'] as Map),
    authorizerProxyId: ProxyId.fromJson(json['authorizerProxyId'] as Map),
    email: json['email'] as String,
    validFrom: DateTime.parse(json['validFrom'] as String),
    validTill: DateTime.parse(json['validTill'] as String),
  );
}

Map<String, dynamic> _$EmailAuthorizationToJson(EmailAuthorization instance) =>
    <String, dynamic>{
      'authorizedProxyId': instance.authorizedProxyId.toJson(),
      'email': instance.email,
      'authorizerProxyId': instance.authorizerProxyId.toJson(),
      'validFrom': instance.validFrom.toIso8601String(),
      'validTill': instance.validTill.toIso8601String(),
    };
