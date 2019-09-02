import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

part 'phone_number_authorization.g.dart';

@JsonSerializable()
class PhoneNumberAuthorization extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final ProxyId authorizedProxyId;

  @JsonKey(nullable: false)
  final String phoneNumber;

  @JsonKey(nullable: false)
  final ProxyId authorizerProxyId;

  @JsonKey(nullable: false)
  final DateTime validFrom;

  @JsonKey(nullable: false)
  final DateTime validTill;

  PhoneNumberAuthorization({
    @required this.authorizedProxyId,
    @required this.authorizerProxyId,
    @required this.phoneNumber,
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
        isNotEmpty(phoneNumber);
  }

  @override
  void assertValid() {
    assertValidProxyObject(authorizerProxyId);
    assertValidProxyId(authorizedProxyId);
    assertValidDateTime(validFrom);
    assertValidDateTime(validTill);
    assertNotEmpty(phoneNumber);
  }

  static PhoneNumberAuthorization fromJson(Map json) => _$PhoneNumberAuthorizationFromJson(json);

  static SignedMessage<PhoneNumberAuthorization> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<PhoneNumberAuthorization> signedMessage = SignedMessage.fromJson<PhoneNumberAuthorization>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$PhoneNumberAuthorizationToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.authorization.PhoneNumberAuthorization";
}
