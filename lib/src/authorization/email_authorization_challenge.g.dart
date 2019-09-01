// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_authorization_challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailAuthorizationChallenge _$EmailAuthorizationChallengeFromJson(Map json) {
  return EmailAuthorizationChallenge(
    request:
        EmailAuthorizationRequest.signedMessageFromJson(json['request'] as Map),
    challengeHash: HashValue.fromJson(json['challengeHash'] as Map),
  );
}

Map<String, dynamic> _$EmailAuthorizationChallengeToJson(
        EmailAuthorizationChallenge instance) =>
    <String, dynamic>{
      'request': instance.request.toJson(),
      'challengeHash': instance.challengeHash.toJson(),
    };
