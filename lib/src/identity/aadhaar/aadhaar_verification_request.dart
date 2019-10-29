import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

part 'aadhaar_verification_request.g.dart';

@JsonSerializable()
class AadhaarVerificationRequest extends SignableRequestMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final String requestId;

  @JsonKey(nullable: false)
  final ProxyId ownerProxyId;

  @JsonKey(nullable: false)
  final String aadhaarNumber;

  @JsonKey(nullable: false)
  final ProxyId identityProviderProxyId;

  AadhaarVerificationRequest({
    @required this.requestId,
    @required this.ownerProxyId,
    @required this.aadhaarNumber,
    @required this.identityProviderProxyId,
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
    return isValidProxyId(ownerProxyId) &&
        isValidProxyId(identityProviderProxyId) &&
        isNotEmpty(requestId) &&
        isNotEmpty(aadhaarNumber);
  }

  @override
  void assertValid() {
    assertValidProxyId(ownerProxyId);
    assertValidProxyId(identityProviderProxyId);
    assertNotEmpty(requestId);
    assertNotEmpty(aadhaarNumber);
  }

  static SignedMessage<AadhaarVerificationRequest> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<AadhaarVerificationRequest> signedMessage = SignedMessage.fromJson<AadhaarVerificationRequest>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  static AadhaarVerificationRequest fromJson(Map json) => _$AadhaarVerificationRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AadhaarVerificationRequestToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.identity.aadhaar.AadhaarVerificationRequest";
}
