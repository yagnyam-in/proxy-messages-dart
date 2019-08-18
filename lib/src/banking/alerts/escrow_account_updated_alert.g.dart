// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escrow_account_updated_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EscrowAccountUpdatedAlert _$EscrowAccountUpdatedAlertFromJson(Map json) {
  return EscrowAccountUpdatedAlert(
    alertId: json['alertId'] as String,
    escrowAccountId: EscrowAccountId.fromJson(json['escrowAccountId'] as Map),
    receivers: (json['receivers'] as List)
        .map((e) => ProxyId.fromJson(e as Map))
        .toList(),
  );
}

Map<String, dynamic> _$EscrowAccountUpdatedAlertToJson(
        EscrowAccountUpdatedAlert instance) =>
    <String, dynamic>{
      'escrowAccountId': instance.escrowAccountId.toJson(),
      'alertId': instance.alertId,
      'receivers': instance.receivers.map((e) => e.toJson()).toList(),
    };
