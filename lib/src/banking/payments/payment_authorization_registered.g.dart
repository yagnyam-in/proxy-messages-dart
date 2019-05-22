// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_authorization_registered.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentAuthorizationRegistered _$PaymentAuthorizationRegisteredFromJson(
    Map<String, dynamic> json) {
  return PaymentAuthorizationRegistered(
      paymentAuthorization: PaymentAuthorization.signedMessageFromJson(
          json['paymentAuthorization'] as Map<String, dynamic>),
      paymentStatus:
          _$enumDecode(_$PaymentStatusEnumEnumMap, json['paymentStatus']));
}

Map<String, dynamic> _$PaymentAuthorizationRegisteredToJson(
        PaymentAuthorizationRegistered instance) =>
    <String, dynamic>{
      'paymentAuthorization': instance.paymentAuthorization,
      'paymentStatus': _$PaymentStatusEnumEnumMap[instance.paymentStatus]
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

const _$PaymentStatusEnumEnumMap = <PaymentStatusEnum, dynamic>{
  PaymentStatusEnum.Registered: 'Registered',
  PaymentStatusEnum.Rejected: 'Rejected',
  PaymentStatusEnum.InsufficientFunds: 'InsufficientFunds',
  PaymentStatusEnum.CancelledByPayer: 'CancelledByPayer',
  PaymentStatusEnum.CancelledByPayee: 'CancelledByPayee',
  PaymentStatusEnum.InProcess: 'InProcess',
  PaymentStatusEnum.Processed: 'Processed',
  PaymentStatusEnum.Expired: 'Expired',
  PaymentStatusEnum.Error: 'Error'
};
