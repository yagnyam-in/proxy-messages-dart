import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

import 'subject_details.dart';

part 'identity_service_provider.g.dart';

@JsonSerializable()
class IdentityServiceProvider extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final ProxyId proxyId;

  @JsonKey(nullable: false)
  final String proxyUniverse;

  @JsonKey(nullable: false)
  final List<SubjectIdTypeEnum> supportedSubjectTypes;

  @JsonKey(nullable: false)
  final String apiEndpoint;

  @JsonKey(nullable: false)
  final String name;

  IdentityServiceProvider({
    @required this.proxyId,
    @required this.proxyUniverse,
    @required this.supportedSubjectTypes,
    @required this.apiEndpoint,
    @required this.name,
  }) {
    assertValid();
  }

  @override
  ProxyId getSigner() {
    return ProxyId("proxy-identity");
  }

  @override
  String toReadableString() {
    return null;
  }

  @override
  bool isValid() {
    return isValidProxyId(proxyId) &&
        isNotEmpty(proxyUniverse) &&
        isNonEmptyList(supportedSubjectTypes) &&
        isNotEmpty(apiEndpoint) &&
        isNotEmpty(name);
  }

  @override
  void assertValid() {
    assertValidProxyId(proxyId);
    assertNotEmpty(proxyUniverse);
    assertNonEmptyList(supportedSubjectTypes);
    assertNotEmpty(apiEndpoint);
    assertNotEmpty(name);
  }

  static IdentityServiceProvider fromJson(Map json) => _$IdentityServiceProviderFromJson(json);

  static SignedMessage<IdentityServiceProvider> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<IdentityServiceProvider> signedMessage = SignedMessage.fromJson<IdentityServiceProvider>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$IdentityServiceProviderToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.banking.IdentityServiceProvider";

  String get id => proxyId.id;
}
