// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escrow_account_creation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EscrowAccountCreationResponse _$EscrowAccountCreationResponseFromJson(
    Map json) {
  return EscrowAccountCreationResponse(
    request: EscrowAccountCreationRequest.signedMessageFromJson(
        json['request'] as Map),
    escrowAccount:
        EscrowAccount.signedMessageFromJson(json['escrowAccount'] as Map),
  );
}

Map<String, dynamic> _$EscrowAccountCreationResponseToJson(
        EscrowAccountCreationResponse instance) =>
    <String, dynamic>{
      'request': instance.request.toJson(),
      'escrowAccount': instance.escrowAccount.toJson(),
    };
