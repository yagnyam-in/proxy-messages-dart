// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Amount _$AmountFromJson(Map json) {
  return Amount(
    currency: json['currency'] as String,
    value: (json['value'] as num).toDouble(),
  );
}

Map<String, dynamic> _$AmountToJson(Amount instance) => <String, dynamic>{
      'currency': instance.currency,
      'value': instance.value,
    };
