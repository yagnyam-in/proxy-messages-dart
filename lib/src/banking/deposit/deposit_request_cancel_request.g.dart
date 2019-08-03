// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_request_cancel_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositRequestCancelRequest _$DepositRequestCancelRequestFromJson(Map json) {
  return DepositRequestCancelRequest(
      requestId: json['requestId'] as String,
      depositRequest:
          DepositRequest.signedMessageFromJson(json['depositRequest'] as Map));
}

Map<String, dynamic> _$DepositRequestCancelRequestToJson(
        DepositRequestCancelRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'depositRequest': instance.depositRequest.toJson()
    };
