// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_authorization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentAuthorization _$PaymentAuthorizationFromJson(Map<String, dynamic> json) {
  return PaymentAuthorization(
      paymentAuthorizationId: json['paymentAuthorizationId'] as String,
      proxyAccount: ProxyAccount.signedMessageFromJson(
          json['proxyAccount'] as Map<String, dynamic>),
      amount: Amount.fromJson(json['amount'] as Map<String, dynamic>),
      payees: (json['payees'] as List)
          .map((e) => Payee.fromJson(e as Map<String, dynamic>))
          .toList());
}

Map<String, dynamic> _$PaymentAuthorizationToJson(
        PaymentAuthorization instance) =>
    <String, dynamic>{
      'paymentAuthorizationId': instance.paymentAuthorizationId,
      'proxyAccount': instance.proxyAccount,
      'amount': instance.amount,
      'payees': instance.payees
    };
