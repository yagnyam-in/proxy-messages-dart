// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_request_creation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestingCustomer _$RequestingCustomerFromJson(Map json) {
  return RequestingCustomer(
    name: json['name'] as String,
    phone: json['phone'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$RequestingCustomerToJson(RequestingCustomer instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
    };

DepositRequestCreationRequest _$DepositRequestCreationRequestFromJson(
    Map json) {
  return DepositRequestCreationRequest(
    depositId: json['depositId'] as String,
    proxyAccount:
        ProxyAccount.signedMessageFromJson(json['proxyAccount'] as Map),
    message: json['message'] as String,
    amount: Amount.fromJson(json['amount'] as Map),
    requestingCustomer: json['requestingCustomer'] == null
        ? null
        : RequestingCustomer.fromJson(json['requestingCustomer'] as Map),
  );
}

Map<String, dynamic> _$DepositRequestCreationRequestToJson(
    DepositRequestCreationRequest instance) {
  final val = <String, dynamic>{
    'depositId': instance.depositId,
    'proxyAccount': instance.proxyAccount.toJson(),
    'message': instance.message,
    'amount': instance.amount.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('requestingCustomer', instance.requestingCustomer?.toJson());
  return val;
}
