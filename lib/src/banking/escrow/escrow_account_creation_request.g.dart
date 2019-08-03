// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escrow_account_creation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EscrowAccountCreationRequest _$EscrowAccountCreationRequestFromJson(Map json) {
  return EscrowAccountCreationRequest(
      escrowAccountId: EscrowAccountId.fromJson(json['escrowAccountId'] as Map),
      escrowProxyId: json['escrowProxyId'] == null
          ? null
          : ProxyId.fromJson(json['escrowProxyId'] as Map),
      payeeProxyId: json['payeeProxyId'] == null
          ? null
          : ProxyId.fromJson(json['payeeProxyId'] as Map),
      debitProxyAccount:
          SignedMessage.fromJson(json['debitProxyAccount'] as Map),
      amount: Amount.fromJson(json['amount'] as Map),
      title: json['title'] as String,
      description: json['description'] as String);
}

Map<String, dynamic> _$EscrowAccountCreationRequestToJson(
    EscrowAccountCreationRequest instance) {
  final val = <String, dynamic>{
    'escrowAccountId': instance.escrowAccountId.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('escrowProxyId', instance.escrowProxyId?.toJson());
  writeNotNull('payeeProxyId', instance.payeeProxyId?.toJson());
  val['debitProxyAccount'] = instance.debitProxyAccount.toJson();
  val['amount'] = instance.amount.toJson();
  val['title'] = instance.title;
  writeNotNull('description', instance.description);
  return val;
}
