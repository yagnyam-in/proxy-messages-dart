// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payee _$PayeeFromJson(Map<String, dynamic> json) {
  return Payee(
      payeeType: _$enumDecode(_$PayeeTypeEnumEnumMap, json['payeeType']),
      proxyAccountId: json['proxyAccountId'] == null
          ? null
          : ProxyAccountId.fromJson(
              json['proxyAccountId'] as Map<String, dynamic>),
      proxyId: json['proxyId'] == null
          ? null
          : ProxyId.fromJson(json['proxyId'] as Map<String, dynamic>),
      email: json['email'] as String,
      phone: json['phone'] as String,
      ivPrefixedSecretHash: json['ivPrefixedSecretHash'] as String);
}

Map<String, dynamic> _$PayeeToJson(Payee instance) => <String, dynamic>{
      'payeeType': _$PayeeTypeEnumEnumMap[instance.payeeType],
      'proxyAccountId': instance.proxyAccountId,
      'proxyId': instance.proxyId,
      'email': instance.email,
      'phone': instance.phone,
      'ivPrefixedSecretHash': instance.ivPrefixedSecretHash
    };

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

const _$PayeeTypeEnumEnumMap = <PayeeTypeEnum, dynamic>{
  PayeeTypeEnum.ProxyAccountId: 'ProxyAccountId',
  PayeeTypeEnum.ProxyId: 'ProxyId',
  PayeeTypeEnum.Email: 'Email',
  PayeeTypeEnum.Phone: 'Phone',
  PayeeTypeEnum.AnyoneWithSecret: 'AnyoneWithSecret'
};
