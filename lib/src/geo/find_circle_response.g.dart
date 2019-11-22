// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_circle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindCircleResponse _$FindCircleResponseFromJson(Map json) {
  return FindCircleResponse(
    request: SignedMessage.fromJson(json['request'] as Map),
    session: SignedMessage.fromJson(json['session'] as Map),
  );
}

Map<String, dynamic> _$FindCircleResponseToJson(FindCircleResponse instance) =>
    <String, dynamic>{
      'request': instance.request.toJson(),
      'session': instance.session.toJson(),
    };
