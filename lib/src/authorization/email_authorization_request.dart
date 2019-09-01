import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

part 'email_authorization_request.g.dart';

@JsonSerializable()
class EmailAuthorizationRequest extends SignableRequestMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final ProxyId requesterProxyId;

  @JsonKey(nullable: false)
  final String email;

  @JsonKey(nullable: false)
  final ProxyId authorizerProxyId;

  @JsonKey(nullable: false)
  final String authorizationId;

  EmailAuthorizationRequest({
    @required this.requesterProxyId,
    @required this.authorizerProxyId,
    @required this.email,
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
        isNotEmpty(email);
  }

  @override
  void assertValid() {
    assertValidProxyObject(authorizerProxyId);
    assertValidProxyId(requesterProxyId);
    assertNotEmpty(authorizationId);
    assertNotEmpty(email);
  }

  static EmailAuthorizationRequest fromJson(Map json) => _$EmailAuthorizationRequestFromJson(json);

  static SignedMessage<EmailAuthorizationRequest> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<EmailAuthorizationRequest> signedMessage = SignedMessage.fromJson<EmailAuthorizationRequest>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$EmailAuthorizationRequestToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.authorization.EmailAuthorizationRequest";

  @override
  String get requestId => authorizationId;
}
