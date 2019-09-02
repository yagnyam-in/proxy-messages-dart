// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_number_authorization_challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneNumberAuthorizationChallenge _$PhoneNumberAuthorizationChallengeFromJson(
    Map json) {
  return PhoneNumberAuthorizationChallenge(
    request: PhoneNumberAuthorizationRequest.signedMessageFromJson(
        json['request'] as Map),
    challengeHash: HashValue.fromJson(json['challengeHash'] as Map),
  );
}

Map<String, dynamic> _$PhoneNumberAuthorizationChallengeToJson(
        PhoneNumberAuthorizationChallenge instance) =>
    <String, dynamic>{
      'request': instance.request.toJson(),
      'challengeHash': instance.challengeHash.toJson(),
    };
