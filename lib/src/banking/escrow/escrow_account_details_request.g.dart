// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escrow_account_details_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EscrowAccountDetailsRequest _$EscrowAccountDetailsRequestFromJson(Map json) {
  return EscrowAccountDetailsRequest(
    escrowAccount:
        EscrowAccount.signedMessageFromJson(json['escrowAccount'] as Map),
  );
}

Map<String, dynamic> _$EscrowAccountDetailsRequestToJson(
        EscrowAccountDetailsRequest instance) =>
    <String, dynamic>{
      'escrowAccount': instance.escrowAccount.toJson(),
    };
