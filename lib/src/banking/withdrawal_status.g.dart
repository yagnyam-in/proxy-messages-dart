// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawal_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawalStatus _$WithdrawalStatusFromJson(Map<String, dynamic> json) {
  return WithdrawalStatus(
      request: Withdrawal.signedMessageFromJson(
          json['request'] as Map<String, dynamic>),
      status: _$enumDecode(_$WithdrawalStatusEnumEnumMap, json['status']));
}

Map<String, dynamic> _$WithdrawalStatusToJson(WithdrawalStatus instance) =>
    <String, dynamic>{
      'request': instance.request,
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
