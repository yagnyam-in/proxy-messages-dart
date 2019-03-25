// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_link_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositLinkResponse _$DepositLinkResponseFromJson(Map<String, dynamic> json) {
  return DepositLinkResponse(
      request: DepositLinkRequest.signedMessageFromJson(
          json['request'] as Map<String, dynamic>),
      depositLink: json['depositLink'] as String);
}

Map<String, dynamic> _$DepositLinkResponseToJson(
        DepositLinkResponse instance) =>
    <String, dynamic>{
      'request': instance.request,
      'depositLink': instance.depositLink
    };
