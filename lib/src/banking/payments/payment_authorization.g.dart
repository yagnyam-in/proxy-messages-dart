// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_authorization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentAuthorization _$PaymentAuthorizationFromJson(Map json) {
  return PaymentAuthorization(
      paymentAuthorizationId: json['paymentAuthorizationId'] as String,
      proxyAccount:
          ProxyAccount.signedMessageFromJson(json['proxyAccount'] as Map),
      amount: Amount.fromJson(json['amount'] as Map),
      payees: (json['payees'] as List)
          .map((e) => Payee.fromJson(e as Map))
          .toList());
}

Map<String, dynamic> _$PaymentAuthorizationToJson(
        PaymentAuthorization instance) =>
    <String, dynamic>{
      'paymentAuthorizationId': instance.paymentAuthorizationId,
      'proxyAccount': instance.proxyAccount.toJson(),
      'amount': instance.amount.toJson(),
      'payees': instance.payees.map((e) => e.toJson()).toList()
    };
