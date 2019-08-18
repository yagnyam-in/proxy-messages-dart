// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_encashment_updated_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentEncashmentUpdatedAlert _$PaymentEncashmentUpdatedAlertFromJson(
    Map json) {
  return PaymentEncashmentUpdatedAlert(
      alertId: json['alertId'] as String,
      payerAccountId: ProxyAccountId.fromJson(json['payerAccountId'] as Map),
      paymentAuthorizationId: json['paymentAuthorizationId'] as String,
      paymentEncashmentId: json['paymentEncashmentId'] as String,
      receivers: (json['receivers'] as List)
          .map((e) => ProxyId.fromJson(e as Map))
          .toList());
}

Map<String, dynamic> _$PaymentEncashmentUpdatedAlertToJson(
        PaymentEncashmentUpdatedAlert instance) =>
    <String, dynamic>{
      'payerAccountId': instance.payerAccountId.toJson(),
      'alertId': instance.alertId,
      'paymentAuthorizationId': instance.paymentAuthorizationId,
      'paymentEncashmentId': instance.paymentEncashmentId,
      'receivers': instance.receivers.map((e) => e.toJson()).toList()
    };
