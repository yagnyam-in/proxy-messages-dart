// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aadhaar_verification_challenge_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AadhaarVerificationChallengeResponse
    _$AadhaarVerificationChallengeResponseFromJson(Map json) {
  return AadhaarVerificationChallengeResponse(
    challenge: AadhaarVerificationChallenge.signedMessageFromJson(
        json['challenge'] as Map),
    response: json['response'] as String,
  );
}

Map<String, dynamic> _$AadhaarVerificationChallengeResponseToJson(
        AadhaarVerificationChallengeResponse instance) =>
    <String, dynamic>{
      'challenge': instance.challenge.toJson(),
      'response': instance.response,
    };
