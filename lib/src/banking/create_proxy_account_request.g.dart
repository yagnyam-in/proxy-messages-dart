// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_proxy_account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProxyAccountRequest _$CreateProxyAccountRequestFromJson(Map json) {
  return CreateProxyAccountRequest(
    requestId: json['requestId'] as String,
    proxyAccount:
        ProxyAccount.signedMessageFromJson(json['proxyAccount'] as Map),
    newOwnerProxyId: ProxyId.fromJson(json['newOwnerProxyId'] as Map),
    permissions: (json['permissions'] as List)
        .map((e) => _$enumDecode(_$ProxyAccountPermissionEnumEnumMap, e))
        .toList(),
  );
}

Map<String, dynamic> _$CreateProxyAccountRequestToJson(
        CreateProxyAccountRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'proxyAccount': instance.proxyAccount.toJson(),
      'newOwnerProxyId': instance.newOwnerProxyId.toJson(),
      'permissions': instance.permissions
          .map((e) => _$ProxyAccountPermissionEnumEnumMap[e])
          .toList(),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

const _$ProxyAccountPermissionEnumEnumMap = {
  ProxyAccountPermissionEnum.InquireAccountDetails: 'InquireAccountDetails',
  ProxyAccountPermissionEnum.InquireBalance: 'InquireBalance',
  ProxyAccountPermissionEnum.AuthorizeProxy: 'AuthorizeProxy',
  ProxyAccountPermissionEnum.MakePayment: 'MakePayment',
};
