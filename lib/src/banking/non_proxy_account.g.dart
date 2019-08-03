// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'non_proxy_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NonProxyAccount _$NonProxyAccountFromJson(Map json) {
  return NonProxyAccount(
      bank: json['bank'] as String,
      accountNumber: json['accountNumber'] as String,
      accountHolder: json['accountHolder'] as String,
      currency: json['currency'] as String,
      ifscCode: json['ifscCode'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String);
}

Map<String, dynamic> _$NonProxyAccountToJson(NonProxyAccount instance) {
  final val = <String, dynamic>{
    'bank': instance.bank,
    'accountNumber': instance.accountNumber,
    'accountHolder': instance.accountHolder,
    'currency': instance.currency,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ifscCode', instance.ifscCode);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  writeNotNull('address', instance.address);
  return val;
}
