// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawal_status_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawalStatusRequest _$WithdrawalStatusRequestFromJson(
    Map<String, dynamic> json) {
  return WithdrawalStatusRequest(
      requestId: json['requestId'] as String,
      request: Withdrawal.signedMessageFromJson(
          json['request'] as Map<String, dynamic>));
}

Map<String, dynamic> _$WithdrawalStatusRequestToJson(
        WithdrawalStatusRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'request': instance.request
    };
