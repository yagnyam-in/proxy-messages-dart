// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_updated_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositUpdatedAlert _$DepositUpdatedAlertFromJson(Map json) {
  return DepositUpdatedAlert(
    alertId: json['alertId'] as String,
    proxyAccountId: ProxyAccountId.fromJson(json['proxyAccountId'] as Map),
    depositId: json['depositId'] as String,
    receiverId: ProxyId.fromJson(json['receiverId'] as Map),
  );
}

Map<String, dynamic> _$DepositUpdatedAlertToJson(
        DepositUpdatedAlert instance) =>
    <String, dynamic>{
      'proxyAccountId': instance.proxyAccountId.toJson(),
      'alertId': instance.alertId,
      'depositId': instance.depositId,
      'receiverId': instance.receiverId.toJson(),
    };
