// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_request_status_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositRequestStatusRequest _$DepositRequestStatusRequestFromJson(Map json) {
  return DepositRequestStatusRequest(
      requestId: json['requestId'] as String,
      depositRequest:
          DepositRequest.signedMessageFromJson(json['depositRequest'] as Map));
}

Map<String, dynamic> _$DepositRequestStatusRequestToJson(
        DepositRequestStatusRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'depositRequest': instance.depositRequest.toJson()
    };
