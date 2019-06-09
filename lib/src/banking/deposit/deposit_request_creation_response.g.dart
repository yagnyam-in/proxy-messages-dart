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
      status: _$enumDecode(_$DepositStatusEnumEnumMap, json['status']));
}

Map<String, dynamic> _$DepositRequestCreationResponseToJson(
        DepositRequestCreationResponse instance) =>
    <String, dynamic>{
      'request': instance.request.toJson(),
      'depositRequest': instance.depositRequest.toJson(),
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
  DepositStatusEnum.Created: 'Created',
  DepositStatusEnum.Registered: 'Registered',
  DepositStatusEnum.Rejected: 'Rejected',
  DepositStatusEnum.InProcess: 'InProcess',
  DepositStatusEnum.Completed: 'Completed',
  DepositStatusEnum.Cancelled: 'Cancelled'
};
