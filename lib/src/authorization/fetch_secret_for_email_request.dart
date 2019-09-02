import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

import 'email_authorization.dart';

part 'fetch_secret_for_email_request.g.dart';

@JsonSerializable()
class FetchSecretForEmailRequest extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false, fromJson: EmailAuthorization.signedMessageFromJson)
  final SignedMessage<EmailAuthorization> emailAuthorization;

  @JsonKey(nullable: false)
  final HashValue secretHash;

  FetchSecretForEmailRequest({
    @required this.emailAuthorization,
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
    return isValidProxyObject(emailAuthorization) && isValidProxyObject(secretHash);
  }

  @override
  void assertValid() {
    assertValidProxyObject(emailAuthorization);
    assertValidProxyObject(secretHash);
  }

  static FetchSecretForEmailRequest fromJson(Map json) => _$FetchSecretForEmailRequestFromJson(json);

  static SignedMessage<FetchSecretForEmailRequest> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<FetchSecretForEmailRequest> signedMessage = SignedMessage.fromJson<FetchSecretForEmailRequest>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$FetchSecretForEmailRequestToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [emailAuthorization];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.authorization.FetchSecretForEmailRequest";

  ProxyId get requesterProxyId => emailAuthorization.message.authorizedProxyId;

  String get email => emailAuthorization.message.email;

  ProxyId get authorizerProxyId => emailAuthorization.message.authorizerProxyId;
}
