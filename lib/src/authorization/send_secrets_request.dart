import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

part 'send_secrets_request.g.dart';

@JsonSerializable()
class SecretForEmailRecipient extends ProxyBaseObject with ProxyUtils {
  @JsonKey(nullable: false)
  final String email;

  @JsonKey(nullable: false)
  final String secret;

  @JsonKey(nullable: false)
  final HashValue secretHash;

  SecretForEmailRecipient({
    @required this.email,
    @required this.secret,
    @required this.secretHash,
  });

  @override
  void assertValid() {
    assertNotEmpty(email);
    assertNotEmpty(secret);
    assertValidProxyObject(secretHash);
  }

  @override
  bool isValid() {
    return isNotEmpty(email) && isNotEmpty(secret) && isValidProxyObject(secretHash);
  }

  Map<String, dynamic> toJson() => _$SecretForEmailRecipientToJson(this);

  static SecretForEmailRecipient fromJson(Map json) => _$SecretForEmailRecipientFromJson(json);
}

@JsonSerializable()
class SecretForPhoneNumberRecipient extends ProxyBaseObject with ProxyUtils {
  @JsonKey(nullable: false)
  final String phoneNumber;

  @JsonKey(nullable: false)
  final String secret;

  @JsonKey(nullable: false)
  final HashValue secretHash;

  SecretForPhoneNumberRecipient({
    @required this.phoneNumber,
    @required this.secret,
    @required this.secretHash,
  });

  @override
  void assertValid() {
    assertNotEmpty(phoneNumber);
    assertNotEmpty(secret);
    assertValidProxyObject(secretHash);
  }

  @override
  bool isValid() {
    return isNotEmpty(phoneNumber) && isNotEmpty(secret) && isValidProxyObject(secretHash);
  }

  Map<String, dynamic> toJson() => _$SecretForPhoneNumberRecipientToJson(this);

  static SecretForPhoneNumberRecipient fromJson(Map json) => _$SecretForPhoneNumberRecipientFromJson(json);
}

@JsonSerializable()
class SendSecretsRequest extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final ProxyId senderProxyId;

  @JsonKey(nullable: false)
  final ProxyId routerProxyId;

  @JsonKey(nullable: false)
  final List<SecretForEmailRecipient> secretsForEmailRecipients;

  @JsonKey(nullable: false)
  final List<SecretForPhoneNumberRecipient> secretsForPhoneNumberRecipients;

  @JsonKey(nullable: false)
  final DateTime validFrom;

  @JsonKey(nullable: false)
  final DateTime validTill;

  SendSecretsRequest({
    @required this.senderProxyId,
    @required this.routerProxyId,
    @required this.secretsForEmailRecipients,
    @required this.secretsForPhoneNumberRecipients,
    @required this.validFrom,
    @required this.validTill,
  }) {
    assertValid();
  }

  @override
  ProxyId getSigner() {
    return senderProxyId;
  }

  @override
  String toReadableString() {
    return null;
  }

  @override
  bool isValid() {
    return isValidProxyId(senderProxyId) &&
        isValidProxyId(routerProxyId) &&
        isValidProxyObjectList(secretsForEmailRecipients) &&
        isValidProxyObjectList(secretsForPhoneNumberRecipients) &&
        isValidDateTime(validFrom) &&
        isValidDateTime(validTill);
  }

  @override
  void assertValid() {
    assertValidProxyId(senderProxyId);
    assertValidProxyId(routerProxyId);
    assertValidProxyObjectList(secretsForEmailRecipients);
    assertValidProxyObjectList(secretsForPhoneNumberRecipients);
    assertValidDateTime(validFrom);
    assertValidDateTime(validTill);
  }

  static SendSecretsRequest fromJson(Map json) => _$SendSecretsRequestFromJson(json);

  static SignedMessage<SendSecretsRequest> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<SendSecretsRequest> signedMessage = SignedMessage.fromJson<SendSecretsRequest>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$SendSecretsRequestToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.authorization.SendSecretsRequest";
}
