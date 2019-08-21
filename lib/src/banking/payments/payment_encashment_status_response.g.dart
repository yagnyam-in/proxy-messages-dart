// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_encashment_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentEncashmentStatusResponse _$PaymentEncashmentStatusResponseFromJson(
    Map json) {
  return PaymentEncashmentStatusResponse(
    request: PaymentEncashmentStatusRequest.signedMessageFromJson(
        json['request'] as Map),
    paymentEncashmentStatus: _$enumDecode(
        _$PaymentEncashmentStatusEnumEnumMap, json['paymentEncashmentStatus']),
  );
}

Map<String, dynamic> _$PaymentEncashmentStatusResponseToJson(
        PaymentEncashmentStatusResponse instance) =>
    <String, dynamic>{
      'request': instance.request.toJson(),
      'paymentEncashmentStatus': _$PaymentEncashmentStatusEnumEnumMap[
          instance.paymentEncashmentStatus],
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

const _$PaymentEncashmentStatusEnumEnumMap = {
  PaymentEncashmentStatusEnum.Created: 'Created',
  PaymentEncashmentStatusEnum.Registered: 'Registered',
  PaymentEncashmentStatusEnum.Rejected: 'Rejected',
  PaymentEncashmentStatusEnum.InsufficientFunds: 'InsufficientFunds',
  PaymentEncashmentStatusEnum.CancelledByPayer: 'CancelledByPayer',
  PaymentEncashmentStatusEnum.CancelledByPayee: 'CancelledByPayee',
  PaymentEncashmentStatusEnum.InProcess: 'InProcess',
  PaymentEncashmentStatusEnum.Processed: 'Processed',
  PaymentEncashmentStatusEnum.Expired: 'Expired',
  PaymentEncashmentStatusEnum.Error: 'Error',
};
