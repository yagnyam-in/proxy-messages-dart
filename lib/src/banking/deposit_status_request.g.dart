// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_status_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositStatusRequest _$DepositStatusRequestFromJson(Map<String, dynamic> json) {
  return DepositStatusRequest(
      requestId: json['requestId'] as String,
      request: DepositRequest.signedMessageFromJson(
          json['request'] as Map<String, dynamic>));
}

Map<String, dynamic> _$DepositStatusRequestToJson(
        DepositStatusRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'request': instance.request
    };
