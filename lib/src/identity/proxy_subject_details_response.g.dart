// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proxy_subject_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProxySubjectDetailsResponse _$ProxySubjectDetailsResponseFromJson(Map json) {
  return ProxySubjectDetailsResponse(
    request: SignedMessage.fromJson(json['request'] as Map),
    subjectDetails: SubjectDetails.fromJson(json['subjectDetails'] as Map),
  );
}

Map<String, dynamic> _$ProxySubjectDetailsResponseToJson(
        ProxySubjectDetailsResponse instance) =>
    <String, dynamic>{
      'request': instance.request.toJson(),
      'subjectDetails': instance.subjectDetails.toJson(),
    };
