// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_encashment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentEncashment _$PaymentEncashmentFromJson(Map json) {
  return PaymentEncashment(
      paymentEncashmentId: json['paymentEncashmentId'] as String,
      paymentAuthorization: PaymentAuthorization.signedMessageFromJson(
          json['paymentAuthorization'] as Map),
      payeeAccount:
          ProxyAccount.signedMessageFromJson(json['payeeAccount'] as Map),
      secret: json['secret'] as String);
}

Map<String, dynamic> _$PaymentEncashmentToJson(PaymentEncashment instance) =>
    <String, dynamic>{
      'paymentEncashmentId': instance.paymentEncashmentId,
      'paymentAuthorization': instance.paymentAuthorization.toJson(),
      'payeeAccount': instance.payeeAccount.toJson(),
      'secret': instance.secret
    };
