// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawal_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawalStatusResponse _$WithdrawalStatusResponseFromJson(Map json) {
  return WithdrawalStatusResponse(
      request:
          WithdrawalStatusRequest.signedMessageFromJson(json['request'] as Map),
      status: _$enumDecode(_$WithdrawalStatusEnumEnumMap, json['status']));
}

Map<String, dynamic> _$WithdrawalStatusResponseToJson(
        WithdrawalStatusResponse instance) =>
    <String, dynamic>{
      'request': instance.request.toJson(),
      'status': _$WithdrawalStatusEnumEnumMap[instance.status]
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

const _$WithdrawalStatusEnumEnumMap = <WithdrawalStatusEnum, dynamic>{
  WithdrawalStatusEnum.Registered: 'Registered',
  WithdrawalStatusEnum.Rejected: 'Rejected',
  WithdrawalStatusEnum.InTransit: 'InTransit',
  WithdrawalStatusEnum.Completed: 'Completed',
  WithdrawalStatusEnum.FailedInTransit: 'FailedInTransit',
  WithdrawalStatusEnum.FailedCompleted: 'FailedCompleted'
};
