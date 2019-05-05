// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositStatusResponse _$DepositStatusResponseFromJson(
    Map<String, dynamic> json) {
  return DepositStatusResponse(
      request: DepositStatusRequest.signedMessageFromJson(
          json['request'] as Map<String, dynamic>),
      status: _$enumDecode(_$DepositStatusEnumEnumMap, json['status']));
}

Map<String, dynamic> _$DepositStatusResponseToJson(
        DepositStatusResponse instance) =>
    <String, dynamic>{
      'request': instance.request,
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