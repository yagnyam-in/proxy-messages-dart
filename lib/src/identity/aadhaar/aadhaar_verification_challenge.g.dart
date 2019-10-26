// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aadhaar_verification_challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AadhaarVerificationChallenge _$AadhaarVerificationChallengeFromJson(Map json) {
  return AadhaarVerificationChallenge(
    request: AadhaarVerificationRequest.signedMessageFromJson(
        json['request'] as Map),
    challengeHash: HashValue.fromJson(json['challengeHash'] as Map),
  );
}

Map<String, dynamic> _$AadhaarVerificationChallengeToJson(
        AadhaarVerificationChallenge instance) =>
    <String, dynamic>{
      'request': instance.request.toJson(),
      'challengeHash': instance.challengeHash.toJson(),
    };
