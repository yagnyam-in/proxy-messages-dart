// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_encashment_status_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentEncashmentStatusRequest _$PaymentEncashmentStatusRequestFromJson(
    Map json) {
  return PaymentEncashmentStatusRequest(
    requestId: json['requestId'] as String,
    paymentEncashment: PaymentEncashment.signedMessageFromJson(
        json['paymentEncashment'] as Map),
  );
}

Map<String, dynamic> _$PaymentEncashmentStatusRequestToJson(
        PaymentEncashmentStatusRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'paymentEncashment': instance.paymentEncashment.toJson(),
    };
