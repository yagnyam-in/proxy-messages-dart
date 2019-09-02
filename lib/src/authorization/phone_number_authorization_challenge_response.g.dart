// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_number_authorization_challenge_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneNumberAuthorizationChallengeResponse
    _$PhoneNumberAuthorizationChallengeResponseFromJson(Map json) {
  return PhoneNumberAuthorizationChallengeResponse(
    challenge: PhoneNumberAuthorizationChallenge.signedMessageFromJson(
        json['challenge'] as Map),
    response: json['response'] as String,
  );
}

Map<String, dynamic> _$PhoneNumberAuthorizationChallengeResponseToJson(
        PhoneNumberAuthorizationChallengeResponse instance) =>
    <String, dynamic>{
      'challenge': instance.challenge.toJson(),
      'response': instance.response,
    };
