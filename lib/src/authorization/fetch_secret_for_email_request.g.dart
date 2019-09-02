// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_secret_for_email_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchSecretForEmailRequest _$FetchSecretForEmailRequestFromJson(Map json) {
  return FetchSecretForEmailRequest(
    emailAuthorization: EmailAuthorization.signedMessageFromJson(
        json['emailAuthorization'] as Map),
    secretHash: HashValue.fromJson(json['secretHash'] as Map),
  );
}

Map<String, dynamic> _$FetchSecretForEmailRequestToJson(
        FetchSecretForEmailRequest instance) =>
    <String, dynamic>{
      'emailAuthorization': instance.emailAuthorization.toJson(),
      'secretHash': instance.secretHash.toJson(),
    };
