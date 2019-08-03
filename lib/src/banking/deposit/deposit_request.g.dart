// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositRequest _$DepositRequestFromJson(Map json) {
  return DepositRequest(
      depositId: json['depositId'] as String,
      proxyAccount:
          ProxyAccount.signedMessageFromJson(json['proxyAccount'] as Map),
      amount: Amount.fromJson(json['amount'] as Map),
      creationDate: DateTime.parse(json['creationDate'] as String),
      expiryDate: DateTime.parse(json['expiryDate'] as String),
      depositLink: json['depositLink'] as String);
}

Map<String, dynamic> _$DepositRequestToJson(DepositRequest instance) =>
    <String, dynamic>{
      'depositId': instance.depositId,
      'proxyAccount': instance.proxyAccount.toJson(),
      'amount': instance.amount.toJson(),
      'creationDate': instance.creationDate.toIso8601String(),
      'expiryDate': instance.expiryDate.toIso8601String(),
      'depositLink': instance.depositLink
    };
