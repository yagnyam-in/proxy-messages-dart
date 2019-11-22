// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorize_bunq_account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizeBunqAccountRequest _$AuthorizeBunqAccountRequestFromJson(Map json) {
  return AuthorizeBunqAccountRequest(
    requestId: json['requestId'] as String,
    ownerProxyId: ProxyId.fromJson(json['ownerProxyId'] as Map),
    bankProxyId: ProxyId.fromJson(json['bankProxyId'] as Map),
    currency: json['currency'] as String,
    apiToken: json['apiToken'] as String,
    accountNumber: json['accountNumber'] as String,
  );
}

Map<String, dynamic> _$AuthorizeBunqAccountRequestToJson(
    AuthorizeBunqAccountRequest instance) {
  final val = <String, dynamic>{
    'requestId': instance.requestId,
    'ownerProxyId': instance.ownerProxyId.toJson(),
    'bankProxyId': instance.bankProxyId.toJson(),
    'currency': instance.currency,
    'apiToken': instance.apiToken,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accountNumber', instance.accountNumber);
  return val;
}
