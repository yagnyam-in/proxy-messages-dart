// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawal_status_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawalStatusRequest _$WithdrawalStatusRequestFromJson(
    Map<String, dynamic> json) {
  return WithdrawalStatusRequest(
      request: Withdrawal.signedMessageFromJson(
          json['request'] as Map<String, dynamic>));
}

Map<String, dynamic> _$WithdrawalStatusRequestToJson(
        WithdrawalStatusRequest instance) =>
    <String, dynamic>{'request': instance.request};
