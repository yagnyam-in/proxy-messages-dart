import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/identity/aadhaar/aadhaar_verification_request.dart';

part 'aadhaar_verification_challenge.g.dart';

@JsonSerializable()
class AadhaarVerificationChallenge extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false, fromJson: AadhaarVerificationRequest.signedMessageFromJson)
  final SignedMessage<AadhaarVerificationRequest> request;

  @JsonKey(nullable: false)
  final HashValue challengeHash;

  AadhaarVerificationChallenge({
    @required this.request,
    @required this.challengeHash,
  }) {
    assertValid();
  }

  @override
  ProxyId getSigner() {
    return identityProviderProxyId;
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

  static SignedMessage<AadhaarVerificationChallenge> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<AadhaarVerificationChallenge> signedMessage =
        SignedMessage.fromJson<AadhaarVerificationChallenge>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  static AadhaarVerificationChallenge fromJson(Map json) => _$AadhaarVerificationChallengeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AadhaarVerificationChallengeToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [request];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.identity.aadhaar.AadhaarVerificationChallenge";

  String get aadhaarNumber => request.message.aadhaarNumber;

  ProxyId get ownerProxyId => request.message.ownerProxyId;

  ProxyId get identityProviderProxyId => request.message.identityProviderProxyId;
}
