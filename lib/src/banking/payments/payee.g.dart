// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payee _$PayeeFromJson(Map<String, dynamic> json) {
  return Payee(
      paymentEncashmentId: json['paymentEncashmentId'] as String,
      payeeType: _$enumDecode(_$PayeeTypeEnumEnumMap, json['payeeType']),
      proxyAccountId: json['proxyAccountId'] == null
          ? null
          : ProxyAccountId.fromJson(
              json['proxyAccountId'] as Map<String, dynamic>),
      proxyId: json['proxyId'] == null
          ? null
          : ProxyId.fromJson(json['proxyId'] as Map<String, dynamic>),
      emailHash: json['emailHash'] as String,
      phoneHash: json['phoneHash'] as String,
      secretHash: json['secretHash'] as String);
}

Map<String, dynamic> _$PayeeToJson(Payee instance) => <String, dynamic>{
      'paymentEncashmentId': instance.paymentEncashmentId,
      'payeeType': _$PayeeTypeEnumEnumMap[instance.payeeType],
      'proxyAccountId': instance.proxyAccountId,
      'proxyId': instance.proxyId,
      'emailHash': instance.emailHash,
      'phoneHash': instance.phoneHash,
      'secretHash': instance.secretHash
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
  PayeeTypeEnum.ProxyId: 'ProxyId',
  PayeeTypeEnum.Email: 'Email',
  PayeeTypeEnum.Phone: 'Phone',
  PayeeTypeEnum.AnyoneWithSecret: 'AnyoneWithSecret'
};
