// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escrow_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EscrowAccount _$EscrowAccountFromJson(Map json) {
  return EscrowAccount(
    escrowAccountId: EscrowAccountId.fromJson(json['escrowAccountId'] as Map),
    payerProxyId: ProxyId.fromJson(json['payerProxyId'] as Map),
    payeeProxyId: ProxyId.fromJson(json['payeeProxyId'] as Map),
    escrowProxyId: ProxyId.fromJson(json['escrowProxyId'] as Map),
    creationDate: DateTime.parse(json['creationDate'] as String),
    expiryDate: DateTime.parse(json['expiryDate'] as String),
    amount: Amount.fromJson(json['amount'] as Map),
    title: json['title'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$EscrowAccountToJson(EscrowAccount instance) {
  final val = <String, dynamic>{
    'escrowAccountId': instance.escrowAccountId.toJson(),
    'payerProxyId': instance.payerProxyId.toJson(),
    'payeeProxyId': instance.payeeProxyId.toJson(),
    'escrowProxyId': instance.escrowProxyId.toJson(),
    'creationDate': instance.creationDate.toIso8601String(),
    'expiryDate': instance.expiryDate.toIso8601String(),
    'amount': instance.amount.toJson(),
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  return val;
}
