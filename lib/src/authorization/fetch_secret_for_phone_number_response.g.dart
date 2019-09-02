// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_secret_for_phone_number_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchSecretForPhoneNumberResponse _$FetchSecretForPhoneNumberResponseFromJson(
    Map json) {
  return FetchSecretForPhoneNumberResponse(
    request: FetchSecretForPhoneNumberRequest.signedMessageFromJson(
        json['request'] as Map),
    secret: json['secret'] as String,
  );
}

Map<String, dynamic> _$FetchSecretForPhoneNumberResponseToJson(
        FetchSecretForPhoneNumberResponse instance) =>
    <String, dynamic>{
      'request': instance.request.toJson(),
      'secret': instance.secret,
    };
