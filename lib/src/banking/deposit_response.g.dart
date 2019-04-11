// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositResponse _$DepositResponseFromJson(Map<String, dynamic> json) {
  return DepositResponse(
      request: DepositRequest.signedMessageFromJson(
          json['request'] as Map<String, dynamic>),
      depositLink: json['depositLink'] as String,
      status: _$enumDecode(_$DepositStatusEnumEnumMap, json['status']));
}

Map<String, dynamic> _$DepositResponseToJson(DepositResponse instance) =>
    <String, dynamic>{
      'request': instance.request,
      'depositLink': instance.depositLink,
      'status': _$DepositStatusEnumEnumMap[instance.status]
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

const _$DepositStatusEnumEnumMap = <DepositStatusEnum, dynamic>{
  DepositStatusEnum.Registered: 'Registered',
  DepositStatusEnum.Rejected: 'Rejected',
  DepositStatusEnum.InProcess: 'InProcess',
  DepositStatusEnum.Completed: 'Completed',
  DepositStatusEnum.Cancelled: 'Cancelled'
};
