// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentRequestLink _$PaymentRequestLinkFromJson(Map json) {
  return PaymentRequestLink(
    payeeVpa: json['pa'] as String,
    payeeName: json['pn'] as String,
    payeeMerchantCode: json['mc'] as String,
    paymentTransactionId: json['tid'] as String,
    underlyingTransactionId: json['tr'] as String,
    transactionNote: json['tn'] as String,
    minimumAmount: json['mam'] as String,
    currency: json['cu'] as String,
    underlyingTransactionUrl: json['url'] as String,
    initiationMode: json['mode'] as String,
    signature: json['sign'] as String,
    organisationID: json['orgid'] as String,
    merchantId: json['mid'] as String,
    storeId: json['msid'] as String,
    terminalId: json['mtid'] as String,
    amount: json['am'] as String,
  );
}

Map<String, dynamic> _$PaymentRequestLinkToJson(PaymentRequestLink instance) {
  final val = <String, dynamic>{
    'pa': instance.payeeVpa,
    'pn': instance.payeeName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('mc', instance.payeeMerchantCode);
  writeNotNull('tid', instance.paymentTransactionId);
  writeNotNull('tr', instance.underlyingTransactionId);
  writeNotNull('tn', instance.transactionNote);
  writeNotNull('am', instance.amount);
  writeNotNull('mam', instance.minimumAmount);
  writeNotNull('cu', instance.currency);
  writeNotNull('url', instance.underlyingTransactionUrl);
  val['mode'] = instance.initiationMode;
  writeNotNull('sign', instance.signature);
  val['orgid'] = instance.organisationID;
  writeNotNull('mid', instance.merchantId);
  writeNotNull('msid', instance.storeId);
  writeNotNull('mtid', instance.terminalId);
  return val;
}
