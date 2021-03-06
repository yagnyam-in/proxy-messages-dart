// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_authorization_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentAuthorizationStatusResponse _$PaymentAuthorizationStatusResponseFromJson(
    Map json) {
  return PaymentAuthorizationStatusResponse(
    request: PaymentAuthorizationStatusRequest.signedMessageFromJson(
        json['request'] as Map),
    paymentAuthorizationStatus: _$enumDecode(
        _$PaymentAuthorizationStatusEnumEnumMap,
        json['paymentAuthorizationStatus']),
  );
}

Map<String, dynamic> _$PaymentAuthorizationStatusResponseToJson(
        PaymentAuthorizationStatusResponse instance) =>
    <String, dynamic>{
      'request': instance.request.toJson(),
      'paymentAuthorizationStatus': _$PaymentAuthorizationStatusEnumEnumMap[
          instance.paymentAuthorizationStatus],
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

const _$PaymentAuthorizationStatusEnumEnumMap = {
  PaymentAuthorizationStatusEnum.Created: 'Created',
  PaymentAuthorizationStatusEnum.Registered: 'Registered',
  PaymentAuthorizationStatusEnum.Rejected: 'Rejected',
  PaymentAuthorizationStatusEnum.InsufficientFunds: 'InsufficientFunds',
  PaymentAuthorizationStatusEnum.CancelledByPayer: 'CancelledByPayer',
  PaymentAuthorizationStatusEnum.CancelledByPayee: 'CancelledByPayee',
  PaymentAuthorizationStatusEnum.InProcess: 'InProcess',
  PaymentAuthorizationStatusEnum.Processed: 'Processed',
  PaymentAuthorizationStatusEnum.Expired: 'Expired',
  PaymentAuthorizationStatusEnum.Error: 'Error',
};
