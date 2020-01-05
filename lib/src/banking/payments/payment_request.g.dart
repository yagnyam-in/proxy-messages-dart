// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentRequest _$PaymentRequestFromJson(Map json) {
  return PaymentRequest(
    paymentRequestId: json['paymentRequestId'] as String,
    proxyAccount:
        ProxyAccount.signedMessageFromJson(json['proxyAccount'] as Map),
    amount: Amount.fromJson(json['amount'] as Map),
    description: json['description'] as String,
    transaction: json['transaction'] as String,
  );
}

Map<String, dynamic> _$PaymentRequestToJson(PaymentRequest instance) {
  final val = <String, dynamic>{
    'paymentRequestId': instance.paymentRequestId,
    'proxyAccount': instance.proxyAccount.toJson(),
    'amount': instance.amount.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('transaction', instance.transaction);
  return val;
}
