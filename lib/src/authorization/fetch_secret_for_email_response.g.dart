// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_secret_for_email_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchSecretForEmailResponse _$FetchSecretForEmailResponseFromJson(Map json) {
  return FetchSecretForEmailResponse(
    request: FetchSecretForEmailRequest.signedMessageFromJson(
        json['request'] as Map),
    secret: json['secret'] as String,
  );
}

Map<String, dynamic> _$FetchSecretForEmailResponseToJson(
        FetchSecretForEmailResponse instance) =>
    <String, dynamic>{
      'request': instance.request.toJson(),
      'secret': instance.secret,
    };
