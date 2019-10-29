import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

import 'subject_details.dart';

part 'relying_party.g.dart';

@JsonSerializable()
class RelyingParty extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final ProxyId proxyId;

  @JsonKey(nullable: false)
  final String proxyUniverse;

  @JsonKey(nullable: false)
  final bool oneAccountPerSubject;

  @JsonKey(nullable: false)
  final List<SubjectFieldEnum> mandatoryFields;

  @JsonKey(nullable: false)
  final List<SubjectFieldEnum> optionalFields;

  @JsonKey(nullable: false)
  final String apiEndpoint;

  @JsonKey(nullable: false)
  final String name;

  @JsonKey(nullable: false)
  final ProxyId identityServiceProviderProxyId;

  RelyingParty({
    @required this.proxyId,
    @required this.proxyUniverse,
    @required this.oneAccountPerSubject,
    @required this.mandatoryFields,
    @required this.optionalFields,
    @required this.apiEndpoint,
    @required this.name,
    @required this.identityServiceProviderProxyId,
  }) {
    assertValid();
  }

  @override
  ProxyId getSigner() {
    return identityServiceProviderProxyId;
  }

  @override
  String toReadableString() {
    return null;
  }

  @override
  bool isValid() {
    return isValidProxyId(proxyId) &&
        isNotEmpty(proxyUniverse) &&
        oneAccountPerSubject != null &&
        isNonEmptyList(mandatoryFields) &&
        isNonEmptyList(optionalFields) &&
        isNotEmpty(apiEndpoint) &&
        isNotEmpty(name) &&
        isValidProxyId(identityServiceProviderProxyId);
  }

  @override
  void assertValid() {
    assertValidProxyId(proxyId);
    assertNotEmpty(proxyUniverse);
    assert(oneAccountPerSubject != null);
    assertNonEmptyList(mandatoryFields);
    assertNonEmptyList(optionalFields);
    assertNotEmpty(apiEndpoint);
    assertNotEmpty(name);
    assertValidProxyId(identityServiceProviderProxyId);
  }

  static RelyingParty fromJson(Map json) => _$RelyingPartyFromJson(json);

  static SignedMessage<RelyingParty> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<RelyingParty> signedMessage = SignedMessage.fromJson<RelyingParty>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$RelyingPartyToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.banking.RelyingParty";

  String get id => proxyId.id;
}
