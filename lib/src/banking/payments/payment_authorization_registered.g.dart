// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_authorization_registered.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentAuthorizationRegistered _$PaymentAuthorizationRegisteredFromJson(
    Map json) {
  return PaymentAuthorizationRegistered(
      paymentAuthorization: PaymentAuthorization.signedMessageFromJson(
          json['paymentAuthorization'] as Map),
      paymentAuthorizationStatus: _$enumDecode(
          _$PaymentAuthorizationStatusEnumEnumMap,
          json['paymentAuthorizationStatus']));
}

Map<String, dynamic> _$PaymentAuthorizationRegisteredToJson(
        PaymentAuthorizationRegistered instance) =>
    <String, dynamic>{
      'paymentAuthorization': instance.paymentAuthorization.toJson(),
      'paymentAuthorizationStatus': _$PaymentAuthorizationStatusEnumEnumMap[
          instance.paymentAuthorizationStatus]
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

const _$PaymentAuthorizationStatusEnumEnumMap =
    <PaymentAuthorizationStatusEnum, dynamic>{
  PaymentAuthorizationStatusEnum.Created: 'Created',
  PaymentAuthorizationStatusEnum.Registered: 'Registered',
  PaymentAuthorizationStatusEnum.Rejected: 'Rejected',
  PaymentAuthorizationStatusEnum.InsufficientFunds: 'InsufficientFunds',
  PaymentAuthorizationStatusEnum.CancelledByPayer: 'CancelledByPayer',
  PaymentAuthorizationStatusEnum.CancelledByPayee: 'CancelledByPayee',
  PaymentAuthorizationStatusEnum.InProcess: 'InProcess',
  PaymentAuthorizationStatusEnum.Processed: 'Processed',
  PaymentAuthorizationStatusEnum.Expired: 'Expired',
  PaymentAuthorizationStatusEnum.Error: 'Error'
};
