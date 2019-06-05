// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_encashment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentEncashment _$PaymentEncashmentFromJson(Map<String, dynamic> json) {
  return PaymentEncashment(
      paymentEncashmentId: json['paymentEncashmentId'] as String,
      paymentAuthorization: PaymentAuthorization.signedMessageFromJson(
          json['paymentAuthorization'] as Map<String, dynamic>),
      payeeAccount: ProxyAccount.signedMessageFromJson(
          json['payeeAccount'] as Map<String, dynamic>),
      secret: json['secret'] as String);
}

Map<String, dynamic> _$PaymentEncashmentToJson(PaymentEncashment instance) =>
    <String, dynamic>{
      'paymentEncashmentId': instance.paymentEncashmentId,
      'paymentAuthorization': instance.paymentAuthorization,
      'payeeAccount': instance.payeeAccount,
      'secret': instance.secret
    };
