// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_request_creation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositRequestCreationResponse _$DepositRequestCreationResponseFromJson(
    Map json) {
  return DepositRequestCreationResponse(
    request: DepositRequestCreationRequest.signedMessageFromJson(
        json['request'] as Map),
    depositRequest:
        DepositRequest.signedMessageFromJson(json['depositRequest'] as Map),
    status: _$enumDecode(_$DepositStatusEnumEnumMap, json['status']),
  );
}

Map<String, dynamic> _$DepositRequestCreationResponseToJson(
        DepositRequestCreationResponse instance) =>
    <String, dynamic>{
      'request': instance.request.toJson(),
      'depositRequest': instance.depositRequest.toJson(),
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
