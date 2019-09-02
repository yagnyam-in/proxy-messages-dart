// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_secrets_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecretForEmailRecipient _$SecretForEmailRecipientFromJson(Map json) {
  return SecretForEmailRecipient(
    email: json['email'] as String,
    secret: json['secret'] as String,
    secretHash: HashValue.fromJson(json['secretHash'] as Map),
  );
}

Map<String, dynamic> _$SecretForEmailRecipientToJson(
        SecretForEmailRecipient instance) =>
    <String, dynamic>{
      'email': instance.email,
      'secret': instance.secret,
      'secretHash': instance.secretHash.toJson(),
    };

SecretForPhoneNumberRecipient _$SecretForPhoneNumberRecipientFromJson(
    Map json) {
  return SecretForPhoneNumberRecipient(
    phoneNumber: json['phoneNumber'] as String,
    secret: json['secret'] as String,
    secretHash: HashValue.fromJson(json['secretHash'] as Map),
  );
}

Map<String, dynamic> _$SecretForPhoneNumberRecipientToJson(
        SecretForPhoneNumberRecipient instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'secret': instance.secret,
      'secretHash': instance.secretHash.toJson(),
    };

SendSecretsRequest _$SendSecretsRequestFromJson(Map json) {
  return SendSecretsRequest(
    senderProxyId: ProxyId.fromJson(json['senderProxyId'] as Map),
    routerProxyId: ProxyId.fromJson(json['routerProxyId'] as Map),
    secretsForEmailRecipients: (json['secretsForEmailRecipients'] as List)
        .map((e) => SecretForEmailRecipient.fromJson(e as Map))
        .toList(),
    secretsForPhoneNumberRecipients:
        (json['secretsForPhoneNumberRecipients'] as List)
            .map((e) => SecretForPhoneNumberRecipient.fromJson(e as Map))
            .toList(),
    validFrom: DateTime.parse(json['validFrom'] as String),
    validTill: DateTime.parse(json['validTill'] as String),
  );
}

Map<String, dynamic> _$SendSecretsRequestToJson(SendSecretsRequest instance) =>
    <String, dynamic>{
      'senderProxyId': instance.senderProxyId.toJson(),
      'routerProxyId': instance.routerProxyId.toJson(),
      'secretsForEmailRecipients':
          instance.secretsForEmailRecipients.map((e) => e.toJson()).toList(),
      'secretsForPhoneNumberRecipients': instance
          .secretsForPhoneNumberRecipients
          .map((e) => e.toJson())
          .toList(),
      'validFrom': instance.validFrom.toIso8601String(),
      'validTill': instance.validTill.toIso8601String(),
    };
