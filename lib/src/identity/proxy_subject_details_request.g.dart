// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proxy_subject_details_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProxySubjectDetailsRequest _$ProxySubjectDetailsRequestFromJson(Map json) {
  return ProxySubjectDetailsRequest(
    proxySubject: SignedMessage.fromJson(json['proxySubject'] as Map),
  );
}

Map<String, dynamic> _$ProxySubjectDetailsRequestToJson(
        ProxySubjectDetailsRequest instance) =>
    <String, dynamic>{
      'proxySubject': instance.proxySubject.toJson(),
    };
