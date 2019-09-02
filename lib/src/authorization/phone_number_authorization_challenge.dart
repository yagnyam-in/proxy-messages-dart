import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

import 'phone_number_authorization_request.dart';

part 'phone_number_authorization_challenge.g.dart';

@JsonSerializable()
class PhoneNumberAuthorizationChallenge extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false, fromJson: PhoneNumberAuthorizationRequest.signedMessageFromJson)
  final SignedMessage<PhoneNumberAuthorizationRequest> request;

  @JsonKey(nullable: false)
  final HashValue challengeHash;

  PhoneNumberAuthorizationChallenge({
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

  static PhoneNumberAuthorizationChallenge fromJson(Map json) => _$PhoneNumberAuthorizationChallengeFromJson(json);

  static SignedMessage<PhoneNumberAuthorizationChallenge> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<PhoneNumberAuthorizationChallenge> signedMessage =
        SignedMessage.fromJson<PhoneNumberAuthorizationChallenge>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$PhoneNumberAuthorizationChallengeToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [request];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.authorization.PhoneNumberAuthorizationChallenge";

  ProxyId get requesterProxyId => request.message.requesterProxyId;

  String get phoneNumber => request.message.phoneNumber;

  ProxyId get authorizerProxyId => request.message.authorizerProxyId;
}
