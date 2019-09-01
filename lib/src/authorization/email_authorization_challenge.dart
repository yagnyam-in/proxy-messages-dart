import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

import 'email_authorization_request.dart';

part 'email_authorization_challenge.g.dart';

@JsonSerializable()
class EmailAuthorizationChallenge extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false, fromJson: EmailAuthorizationRequest.signedMessageFromJson)
  final SignedMessage<EmailAuthorizationRequest> request;

  @JsonKey(nullable: false)
  final HashValue challengeHash;

  EmailAuthorizationChallenge({
    @required this.request,
    @required this.challengeHash,
  }) {
    assertValid();
  }

  @override
  ProxyId getSigner() {
    return authorizerProxyId;
  }

  @override
  String toReadableString() {
    return null;
  }

  @override
  bool isValid() {
    return isValidProxyObject(request) && isValidProxyObject(challengeHash);
  }

  @override
  void assertValid() {
    assertValidProxyObject(request);
    assertValidProxyObject(challengeHash);
  }

  static EmailAuthorizationChallenge fromJson(Map json) => _$EmailAuthorizationChallengeFromJson(json);

  static SignedMessage<EmailAuthorizationChallenge> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<EmailAuthorizationChallenge> signedMessage =
        SignedMessage.fromJson<EmailAuthorizationChallenge>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$EmailAuthorizationChallengeToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [request];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.authorization.EmailAuthorizationChallenge";

  ProxyId get requesterProxyId => request.message.requesterProxyId;

  String get email => request.message.email;

  ProxyId get authorizerProxyId => request.message.authorizerProxyId;
}
