// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_link_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestingCustomer _$RequestingCustomerFromJson(Map<String, dynamic> json) {
  return RequestingCustomer(
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String);
}

Map<String, dynamic> _$RequestingCustomerToJson(RequestingCustomer instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email
    };

DepositLinkRequest _$DepositLinkRequestFromJson(Map<String, dynamic> json) {
  return DepositLinkRequest(
      requestId: json['requestId'] as String,
      proxyAccount: ProxyAccount.signedMessageFromJson(
          json['proxyAccount'] as Map<String, dynamic>),
      accountName: json['accountName'] as String,
      amount: Amount.fromJson(json['amount'] as Map<String, dynamic>),
      message: json['message'] as String,
      requestingCustomer: json['requestingCustomer'] == null
          ? null
          : RequestingCustomer.fromJson(
              json['requestingCustomer'] as Map<String, dynamic>));
}

Map<String, dynamic> _$DepositLinkRequestToJson(DepositLinkRequest instance) {
  final val = <String, dynamic>{
    'requestId': instance.requestId,
    'proxyAccount': instance.proxyAccount,
    'accountName': instance.accountName,
    'amount': instance.amount,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  writeNotNull('requestingCustomer', instance.requestingCustomer);
  return val;
}
