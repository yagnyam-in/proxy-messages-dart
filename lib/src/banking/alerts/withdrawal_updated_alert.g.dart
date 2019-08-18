// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawal_updated_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawalUpdatedAlert _$WithdrawalUpdatedAlertFromJson(Map json) {
  return WithdrawalUpdatedAlert(
      alertId: json['alertId'] as String,
      proxyAccountId: ProxyAccountId.fromJson(json['proxyAccountId'] as Map),
      withdrawalId: json['withdrawalId'] as String,
      receiverId: ProxyId.fromJson(json['receiverId'] as Map));
}

Map<String, dynamic> _$WithdrawalUpdatedAlertToJson(
        WithdrawalUpdatedAlert instance) =>
    <String, dynamic>{
      'proxyAccountId': instance.proxyAccountId.toJson(),
      'alertId': instance.alertId,
      'withdrawalId': instance.withdrawalId,
      'receiverId': instance.receiverId.toJson()
    };
