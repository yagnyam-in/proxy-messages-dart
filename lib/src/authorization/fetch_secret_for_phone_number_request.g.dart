// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_secret_for_phone_number_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchSecretForPhoneNumberRequest _$FetchSecretForPhoneNumberRequestFromJson(
    Map json) {
  return FetchSecretForPhoneNumberRequest(
    phoneNumberAuthorization: PhoneNumberAuthorization.signedMessageFromJson(
        json['phoneNumberAuthorization'] as Map),
    secretHash: HashValue.fromJson(json['secretHash'] as Map),
  );
}

Map<String, dynamic> _$FetchSecretForPhoneNumberRequestToJson(
        FetchSecretForPhoneNumberRequest instance) =>
    <String, dynamic>{
      'phoneNumberAuthorization': instance.phoneNumberAuthorization.toJson(),
      'secretHash': instance.secretHash.toJson(),
    };
