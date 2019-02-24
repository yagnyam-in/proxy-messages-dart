// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Amount _$AmountFromJson(Map<String, dynamic> json) {
  return Amount(json['currency'] as String, (json['value'] as num).toDouble());
}

Map<String, dynamic> _$AmountToJson(Amount instance) =>
    <String, dynamic>{'currency': instance.currency, 'value': instance.value};
