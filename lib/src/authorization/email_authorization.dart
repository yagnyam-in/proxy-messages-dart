import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

part 'email_authorization.g.dart';

@JsonSerializable()
class EmailAuthorization extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final ProxyId authorizedProxyId;

  @JsonKey(nullable: false)
  final String email;

  @JsonKey(nullable: false)
  final ProxyId authorizerProxyId;

  @JsonKey(nullable: false)
  final DateTime validFrom;

  @JsonKey(nullable: false)
  final DateTime validTill;

  EmailAuthorization({
    @required this.authorizedProxyId,
    @required this.authorizerProxyId,
    @required this.email,
    @required this.validFrom,
    @required this.validTill,
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
    return isValidProxyObject(authorizedProxyId) &&
        isValidProxyId(authorizerProxyId) &&
        isValidDateTime(validFrom) &&
        isValidDateTime(validTill) &&
        isNotEmpty(email);
  }

  @override
  void assertValid() {
    assertValidProxyObject(authorizerProxyId);
    assertValidProxyId(authorizedProxyId);
    assertValidDateTime(validFrom);
    assertValidDateTime(validTill);
    assertNotEmpty(email);
  }

  static EmailAuthorization fromJson(Map json) => _$EmailAuthorizationFromJson(json);

  static SignedMessage<EmailAuthorization> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<EmailAuthorization> signedMessage = SignedMessage.fromJson<EmailAuthorization>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$EmailAuthorizationToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.authorization.EmailAuthorization";
}
