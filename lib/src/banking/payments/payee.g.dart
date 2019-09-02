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
    emailHash: json['emailHash'] == null
        ? null
        : HashValue.fromJson(json['emailHash'] as Map),
    phoneHash: json['phoneHash'] == null
        ? null
        : HashValue.fromJson(json['phoneHash'] as Map),
    secretHash: json['secretHash'] == null
        ? null
        : HashValue.fromJson(json['secretHash'] as Map),
  );
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
  writeNotNull('emailHash', instance.emailHash?.toJson());
  writeNotNull('phoneHash', instance.phoneHash?.toJson());
  writeNotNull('secretHash', instance.secretHash?.toJson());
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

const _$PayeeTypeEnumEnumMap = {
  PayeeTypeEnum.ProxyId: 'ProxyId',
  PayeeTypeEnum.Email: 'Email',
  PayeeTypeEnum.Phone: 'Phone',
  PayeeTypeEnum.AnyoneWithSecret: 'AnyoneWithSecret',
};
