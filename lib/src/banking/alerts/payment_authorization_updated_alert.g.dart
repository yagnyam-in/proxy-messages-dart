// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_authorization_updated_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentAuthorizationUpdatedAlert _$PaymentAuthorizationUpdatedAlertFromJson(
    Map json) {
  return PaymentAuthorizationUpdatedAlert(
    alertId: json['alertId'] as String,
    payerAccountId: ProxyAccountId.fromJson(json['payerAccountId'] as Map),
    paymentAuthorizationId: json['paymentAuthorizationId'] as String,
    receivers: (json['receivers'] as List)
        .map((e) => ProxyId.fromJson(e as Map))
        .toList(),
  );
}

Map<String, dynamic> _$PaymentAuthorizationUpdatedAlertToJson(
        PaymentAuthorizationUpdatedAlert instance) =>
    <String, dynamic>{
      'payerAccountId': instance.payerAccountId.toJson(),
      'alertId': instance.alertId,
      'paymentAuthorizationId': instance.paymentAuthorizationId,
      'receivers': instance.receivers.map((e) => e.toJson()).toList(),
    };
