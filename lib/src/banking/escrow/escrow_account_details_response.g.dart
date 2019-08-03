// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escrow_account_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EscrowAccountDetailsResponse _$EscrowAccountDetailsResponseFromJson(Map json) {
  return EscrowAccountDetailsResponse(
      request: EscrowAccountDetailsRequest.signedMessageFromJson(
          json['request'] as Map),
      status: _$enumDecode(_$EscrowAccountStatusEnumEnumMap, json['status']));
}

Map<String, dynamic> _$EscrowAccountDetailsResponseToJson(
        EscrowAccountDetailsResponse instance) =>
    <String, dynamic>{
      'request': instance.request.toJson(),
      'status': _$EscrowAccountStatusEnumEnumMap[instance.status]
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

const _$EscrowAccountStatusEnumEnumMap = <EscrowAccountStatusEnum, dynamic>{
  EscrowAccountStatusEnum.Ready: 'Ready',
  EscrowAccountStatusEnum.Completed: 'Completed',
  EscrowAccountStatusEnum.Cancelled: 'Cancelled'
};
