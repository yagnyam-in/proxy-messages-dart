// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_updated_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountUpdatedAlert _$AccountUpdatedAlertFromJson(Map json) {
  return AccountUpdatedAlert(
      alertId: json['alertId'] as String,
      proxyAccountId: ProxyAccountId.fromJson(json['proxyAccountId'] as Map),
      receiverId: ProxyId.fromJson(json['receiverId'] as Map));
}

Map<String, dynamic> _$AccountUpdatedAlertToJson(
        AccountUpdatedAlert instance) =>
    <String, dynamic>{
      'proxyAccountId': instance.proxyAccountId.toJson(),
      'alertId': instance.alertId,
      'receiverId': instance.receiverId.toJson()
    };
