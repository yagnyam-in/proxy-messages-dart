// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_authorization_challenge_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailAuthorizationChallengeResponse
    _$EmailAuthorizationChallengeResponseFromJson(Map json) {
  return EmailAuthorizationChallengeResponse(
    challenge: EmailAuthorizationChallenge.signedMessageFromJson(
        json['challenge'] as Map),
    response: json['response'] as String,
  );
}

Map<String, dynamic> _$EmailAuthorizationChallengeResponseToJson(
        EmailAuthorizationChallengeResponse instance) =>
    <String, dynamic>{
      'challenge': instance.challenge.toJson(),
      'response': instance.response,
    };
