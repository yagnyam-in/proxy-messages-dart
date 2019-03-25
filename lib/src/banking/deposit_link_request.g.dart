// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_link_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RequestingCustomer _$_RequestingCustomerFromJson(Map<String, dynamic> json) {
  return _RequestingCustomer(
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String);
}

Map<String, dynamic> _$_RequestingCustomerToJson(
        _RequestingCustomer instance) =>
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
          : _RequestingCustomer.fromJson(
              json['requestingCustomer'] as Map<String, dynamic>));
}

Map<String, dynamic> _$DepositLinkRequestToJson(DepositLinkRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'proxyAccount': instance.proxyAccount,
      'accountName': instance.accountName,
      'amount': instance.amount,
      'message': instance.message,
      'requestingCustomer': instance.requestingCustomer
    };
