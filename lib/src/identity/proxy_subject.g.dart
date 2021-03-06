// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proxy_subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProxySubject _$ProxySubjectFromJson(Map json) {
  return ProxySubject(
    proxySubjectId: ProxySubjectId.fromJson(json['proxySubjectId'] as Map),
    ownerProxyId: ProxyId.fromJson(json['ownerProxyId'] as Map),
    relyingPartyProxyId: ProxyId.fromJson(json['relyingPartyProxyId'] as Map),
    creationDate: DateTime.parse(json['creationDate'] as String),
    expiryDate: DateTime.parse(json['expiryDate'] as String),
  );
}

Map<String, dynamic> _$ProxySubjectToJson(ProxySubject instance) =>
    <String, dynamic>{
      'proxySubjectId': instance.proxySubjectId.toJson(),
      'ownerProxyId': instance.ownerProxyId.toJson(),
      'relyingPartyProxyId': instance.relyingPartyProxyId.toJson(),
      'creationDate': instance.creationDate.toIso8601String(),
      'expiryDate': instance.expiryDate.toIso8601String(),
    };
