// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_authorization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentAuthorization _$PaymentAuthorizationFromJson(Map<String, dynamic> json) {
  return PaymentAuthorization(
      paymentId: json['paymentId'] as String,
      proxyAccount: ProxyAccount.signedMessageFromJson(
          json['proxyAccount'] as Map<String, dynamic>),
      amount: Amount.fromJson(json['amount'] as Map<String, dynamic>),
      payee: Payee.fromJson(json['payee'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PaymentAuthorizationToJson(
        PaymentAuthorization instance) =>
    <String, dynamic>{
      'paymentId': instance.paymentId,
      'proxyAccount': instance.proxyAccount,
      'amount': instance.amount,
      'payee': instance.payee
    };
