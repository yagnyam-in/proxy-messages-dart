// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proxy_subject_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProxySubjectId _$ProxySubjectIdFromJson(Map json) {
  return ProxySubjectId(
    subjectId: json['subjectId'] as String,
    issuerProxyId: ProxyId.fromJson(json['issuerProxyId'] as Map),
    proxyUniverse: json['proxyUniverse'] as String,
  );
}

Map<String, dynamic> _$ProxySubjectIdToJson(ProxySubjectId instance) =>
    <String, dynamic>{
      'subjectId': instance.subjectId,
      'issuerProxyId': instance.issuerProxyId.toJson(),
      'proxyUniverse': instance.proxyUniverse,
    };
