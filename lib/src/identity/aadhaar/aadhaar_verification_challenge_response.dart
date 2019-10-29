import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

import 'aadhaar_verification_challenge.dart';

part 'aadhaar_verification_challenge_response.g.dart';

@JsonSerializable()
class AadhaarVerificationChallengeResponse extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false, fromJson: AadhaarVerificationChallenge.signedMessageFromJson)
  final SignedMessage<AadhaarVerificationChallenge> challenge;

  @JsonKey(nullable: false)
  final String response;

  AadhaarVerificationChallengeResponse({
    @required this.challenge,
    @required this.response,
  }) {
    assertValid();
  }

  @override
  ProxyId getSigner() {
    return ownerProxyId;
  }

  @override
  String toReadableString() {
    return null;
  }

  @override
  bool isValid() {
    return isValidProxyObject(challenge) &&
        isNotEmpty(response);
  }

  @override
  void assertValid() {
    assertValidProxyObject(challenge);
    isNotEmpty(response);
  }

  static SignedMessage<AadhaarVerificationChallengeResponse> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<AadhaarVerificationChallengeResponse> signedMessage = SignedMessage.fromJson<AadhaarVerificationChallengeResponse>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  static AadhaarVerificationChallengeResponse fromJson(Map json) => _$AadhaarVerificationChallengeResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AadhaarVerificationChallengeResponseToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [challenge];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.identity.aadhaar.AadhaarVerificationChallengeResponse";

  String get aadhaarNumber => challenge.message.aadhaarNumber;

  ProxyId get ownerProxyId => challenge.message.ownerProxyId;

  ProxyId get identityProviderProxyId => challenge.message.identityProviderProxyId;
}
