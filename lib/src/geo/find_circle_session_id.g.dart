// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_circle_session_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindCircleSessionId _$FindCircleSessionIdFromJson(Map json) {
  return FindCircleSessionId(
    serviceProviderId: ProxyId.fromJson(json['serviceProviderId'] as Map),
    sessionId: json['sessionId'] as String,
  );
}

Map<String, dynamic> _$FindCircleSessionIdToJson(
        FindCircleSessionId instance) =>
    <String, dynamic>{
      'serviceProviderId': instance.serviceProviderId.toJson(),
      'sessionId': instance.sessionId,
    };
