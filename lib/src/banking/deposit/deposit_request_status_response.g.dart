// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_request_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositRequestStatusResponse _$DepositRequestStatusResponseFromJson(Map json) {
  return DepositRequestStatusResponse(
    request: DepositRequestStatusRequest.signedMessageFromJson(
        json['request'] as Map),
    status: _$enumDecode(_$DepositStatusEnumEnumMap, json['status']),
  );
}

Map<String, dynamic> _$DepositRequestStatusResponseToJson(
        DepositRequestStatusResponse instance) =>
    <String, dynamic>{
      'request': instance.request.toJson(),
      'status': _$DepositStatusEnumEnumMap[instance.status],
    };

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

const _$DepositStatusEnumEnumMap = {
  DepositStatusEnum.Created: 'Created',
  DepositStatusEnum.Registered: 'Registered',
  DepositStatusEnum.Rejected: 'Rejected',
  DepositStatusEnum.InProcess: 'InProcess',
  DepositStatusEnum.Completed: 'Completed',
  DepositStatusEnum.Cancelled: 'Cancelled',
};
