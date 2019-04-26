// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_request.dart';

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

DepositRequest _$DepositRequestFromJson(Map<String, dynamic> json) {
  return DepositRequest(
      depositId: json['depositId'] as String,
      proxyAccount: ProxyAccount.signedMessageFromJson(
          json['proxyAccount'] as Map<String, dynamic>),
      message: json['message'] as String,
      amount: Amount.fromJson(json['amount'] as Map<String, dynamic>),
      requestingCustomer: json['requestingCustomer'] == null
          ? null
          : RequestingCustomer.fromJson(
              json['requestingCustomer'] as Map<String, dynamic>));
}

Map<String, dynamic> _$DepositRequestToJson(DepositRequest instance) {
  final val = <String, dynamic>{
    'depositId': instance.depositId,
    'proxyAccount': instance.proxyAccount,
    'message': instance.message,
    'amount': instance.amount,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('requestingCustomer', instance.requestingCustomer);
  return val;
}
