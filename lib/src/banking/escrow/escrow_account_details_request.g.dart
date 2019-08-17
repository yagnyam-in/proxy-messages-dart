// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escrow_account_details_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EscrowAccountDetailsRequest _$EscrowAccountDetailsRequestFromJson(Map json) {
  return EscrowAccountDetailsRequest(
    requestId: json['requestId'] as String,
    escrowAccount:
        EscrowAccount.signedMessageFromJson(json['escrowAccount'] as Map),
  );
}

Map<String, dynamic> _$EscrowAccountDetailsRequestToJson(
        EscrowAccountDetailsRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'escrowAccount': instance.escrowAccount.toJson(),
    };
