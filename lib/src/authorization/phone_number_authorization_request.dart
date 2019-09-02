import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

part 'phone_number_authorization_request.g.dart';

@JsonSerializable()
class PhoneNumberAuthorizationRequest extends SignableRequestMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final ProxyId requesterProxyId;

  @JsonKey(nullable: false)
  final String phoneNumber;

  @JsonKey(nullable: false)
  final ProxyId authorizerProxyId;

  @JsonKey(nullable: false)
  final String authorizationId;

  PhoneNumberAuthorizationRequest({
    @required this.requesterProxyId,
    @required this.authorizerProxyId,
    @required this.phoneNumber,
    @required this.authorizationId,
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
    return isValidProxyObject(requesterProxyId) &&
        isValidProxyId(authorizerProxyId) &&
        isNotEmpty(authorizationId) &&
        isNotEmpty(phoneNumber);
  }

  @override
  void assertValid() {
    assertValidProxyObject(authorizerProxyId);
    assertValidProxyId(requesterProxyId);
    assertNotEmpty(authorizationId);
    assertNotEmpty(phoneNumber);
  }

  static PhoneNumberAuthorizationRequest fromJson(Map json) => _$PhoneNumberAuthorizationRequestFromJson(json);

  static SignedMessage<PhoneNumberAuthorizationRequest> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<PhoneNumberAuthorizationRequest> signedMessage = SignedMessage.fromJson<PhoneNumberAuthorizationRequest>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$PhoneNumberAuthorizationRequestToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.authorization.PhoneNumberAuthorizationRequest";

  @override
  String get requestId => authorizationId;
}
