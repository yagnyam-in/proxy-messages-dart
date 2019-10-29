// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proxy_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProxyAccount _$ProxyAccountFromJson(Map json) {
  return ProxyAccount(
    proxyAccountId: ProxyAccountId.fromJson(json['proxyAccountId'] as Map),
    ownerProxyId: ProxyId.fromJson(json['ownerProxyId'] as Map),
    currency: json['currency'] as String,
    creationDate: DateTime.parse(json['creationDate'] as String),
    expiryDate: DateTime.parse(json['expiryDate'] as String),
    permissions: (json['permissions'] as List)
        ?.map(
            (e) => _$enumDecodeNullable(_$ProxyAccountPermissionEnumEnumMap, e))
        ?.toList(),
    maximumAmountPerTransaction:
        Amount.fromJson(json['maximumAmountPerTransaction'] as Map),
  );
}

Map<String, dynamic> _$ProxyAccountToJson(ProxyAccount instance) {
  final val = <String, dynamic>{
    'proxyAccountId': instance.proxyAccountId.toJson(),
    'ownerProxyId': instance.ownerProxyId.toJson(),
    'creationDate': instance.creationDate.toIso8601String(),
    'expiryDate': instance.expiryDate.toIso8601String(),
    'currency': instance.currency,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'permissions',
      instance.permissions
          ?.map((e) => _$ProxyAccountPermissionEnumEnumMap[e])
          ?.toList());
  val['maximumAmountPerTransaction'] =
      instance.maximumAmountPerTransaction.toJson();
  return val;
}

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

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ProxyAccountPermissionEnumEnumMap = {
  ProxyAccountPermissionEnum.InquireAccountDetails: 'InquireAccountDetails',
  ProxyAccountPermissionEnum.InquireBalance: 'InquireBalance',
  ProxyAccountPermissionEnum.AuthorizeProxy: 'AuthorizeProxy',
  ProxyAccountPermissionEnum.MakePayment: 'MakePayment',
};
