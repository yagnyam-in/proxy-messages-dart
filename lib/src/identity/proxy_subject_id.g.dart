// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proxy_subject_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProxySubjectId _$ProxySubjectIdFromJson(Map json) {
  return ProxySubjectId(
    subjectId: json['subjectId'] as String,
    identityProviderProxyId:
        ProxyId.fromJson(json['identityProviderProxyId'] as Map),
  );
}

Map<String, dynamic> _$ProxySubjectIdToJson(ProxySubjectId instance) =>
    <String, dynamic>{
      'subjectId': instance.subjectId,
      'identityProviderProxyId': instance.identityProviderProxyId.toJson(),
    };
