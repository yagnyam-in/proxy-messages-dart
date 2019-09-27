// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_authorization_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailAuthorizationRequest _$EmailAuthorizationRequestFromJson(Map json) {
  return EmailAuthorizationRequest(
    requesterProxyId: ProxyId.fromJson(json['requesterProxyId'] as Map),
    authorizerProxyId: ProxyId.fromJson(json['authorizerProxyId'] as Map),
    email: json['email'] as String,
    authorizationId: json['authorizationId'] as String,
    index: json['index'] as String,
  );
}

Map<String, dynamic> _$EmailAuthorizationRequestToJson(
    EmailAuthorizationRequest instance) {
  final val = <String, dynamic>{
    'requesterProxyId': instance.requesterProxyId.toJson(),
    'email': instance.email,
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
