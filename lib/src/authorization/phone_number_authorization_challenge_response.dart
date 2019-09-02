import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

import 'phone_number_authorization_challenge.dart';

part 'phone_number_authorization_challenge_response.g.dart';

@JsonSerializable()
class PhoneNumberAuthorizationChallengeResponse extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false, fromJson: PhoneNumberAuthorizationChallenge.signedMessageFromJson)
  final SignedMessage<PhoneNumberAuthorizationChallenge> challenge;

  @JsonKey(nullable: false)
  final String response;

  PhoneNumberAuthorizationChallengeResponse({
    @required this.challenge,
    @required this.response,
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
    return isValidProxyObject(challenge) && isNotEmpty(response);
  }

  @override
  void assertValid() {
    assertValidProxyObject(challenge);
    assertNotEmpty(response);
  }

  static PhoneNumberAuthorizationChallengeResponse fromJson(Map json) =>
      _$PhoneNumberAuthorizationChallengeResponseFromJson(json);

  static SignedMessage<PhoneNumberAuthorizationChallengeResponse> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<PhoneNumberAuthorizationChallengeResponse> signedMessage =
        SignedMessage.fromJson<PhoneNumberAuthorizationChallengeResponse>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$PhoneNumberAuthorizationChallengeResponseToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [challenge];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.authorization.PhoneNumberAuthorizationChallengeResponse";

  ProxyId get requesterProxyId => challenge.message.requesterProxyId;

  String get phoneNumber => challenge.message.phoneNumber;

  ProxyId get authorizerProxyId => challenge.message.authorizerProxyId;
}
