import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

import 'phone_number_authorization.dart';

part 'fetch_secret_for_phone_number_request.g.dart';

@JsonSerializable()
class FetchSecretForPhoneNumberRequest extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false, fromJson: PhoneNumberAuthorization.signedMessageFromJson)
  final SignedMessage<PhoneNumberAuthorization> phoneNumberAuthorization;

  @JsonKey(nullable: false)
  final HashValue secretHash;

  FetchSecretForPhoneNumberRequest({
    @required this.phoneNumberAuthorization,
    @required this.secretHash,
  }) {
    assertValid();
  }

  @override
  ProxyId getSigner() {
    return requesterProxyId;
  }

  @override
  String toReadableString() {
    return null;
  }

  @override
  bool isValid() {
    return isValidProxyObject(phoneNumberAuthorization) && isValidProxyObject(secretHash);
  }

  @override
  void assertValid() {
    assertValidProxyObject(phoneNumberAuthorization);
    assertValidProxyObject(secretHash);
  }

  static FetchSecretForPhoneNumberRequest fromJson(Map json) => _$FetchSecretForPhoneNumberRequestFromJson(json);

  static SignedMessage<FetchSecretForPhoneNumberRequest> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<FetchSecretForPhoneNumberRequest> signedMessage =
        SignedMessage.fromJson<FetchSecretForPhoneNumberRequest>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$FetchSecretForPhoneNumberRequestToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [phoneNumberAuthorization];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.authorization.FetchSecretForPhoneNumberRequest";

  ProxyId get requesterProxyId => phoneNumberAuthorization.message.authorizedProxyId;

  String get phoneNumber => phoneNumberAuthorization.message.phoneNumber;

  ProxyId get authorizerProxyId => phoneNumberAuthorization.message.authorizerProxyId;
}
