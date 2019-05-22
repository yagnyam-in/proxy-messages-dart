// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_authorization_status_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentAuthorizationStatusRequest _$PaymentAuthorizationStatusRequestFromJson(
    Map<String, dynamic> json) {
  return PaymentAuthorizationStatusRequest(
      requestId: json['requestId'] as String,
      paymentAuthorization: PaymentAuthorization.signedMessageFromJson(
          json['paymentAuthorization'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PaymentAuthorizationStatusRequestToJson(
        PaymentAuthorizationStatusRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'paymentAuthorization': instance.paymentAuthorization
    };
