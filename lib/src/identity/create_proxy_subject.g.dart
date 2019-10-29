// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_proxy_subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProxySubjectRequest _$CreateProxySubjectRequestFromJson(Map json) {
  return CreateProxySubjectRequest(
    requestId: json['requestId'] as String,
    relyingPartyId: json['relyingPartyId'] as String,
    relyingPartyProxyId: ProxyId.fromJson(json['relyingPartyProxyId'] as Map),
    proxySubject: SignedMessage.fromJson(json['proxySubject'] as Map),
    newOwnerProxyId: ProxyId.fromJson(json['newOwnerProxyId'] as Map),
    subjectDetails: SubjectDetails.fromJson(json['subjectDetails'] as Map),
  );
}

Map<String, dynamic> _$CreateProxySubjectRequestToJson(
        CreateProxySubjectRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'relyingPartyId': instance.relyingPartyId,
      'relyingPartyProxyId': instance.relyingPartyProxyId.toJson(),
      'proxySubject': instance.proxySubject.toJson(),
      'newOwnerProxyId': instance.newOwnerProxyId.toJson(),
      'subjectDetails': instance.subjectDetails.toJson(),
    };
