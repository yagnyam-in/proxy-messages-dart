// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payee _$PayeeFromJson(Map json) {
  return Payee(
      paymentEncashmentId: json['paymentEncashmentId'] as String,
      payeeType: _$enumDecode(_$PayeeTypeEnumEnumMap, json['payeeType']),
      proxyId: json['proxyId'] == null
          ? null
          : ProxyId.fromJson(json['proxyId'] as Map),
      emailHash: json['emailHash'] as String,
      phoneHash: json['phoneHash'] as String,
      secretHash: json['secretHash'] as String);
}

Map<String, dynamic> _$PayeeToJson(Payee instance) {
  final val = <String, dynamic>{
    'paymentEncashmentId': instance.paymentEncashmentId,
    'payeeType': _$PayeeTypeEnumEnumMap[instance.payeeType],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('proxyId', instance.proxyId?.toJson());
  writeNotNull('emailHash', instance.emailHash);
  writeNotNull('phoneHash', instance.phoneHash);
  writeNotNull('secretHash', instance.secretHash);
  return val;
}

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
