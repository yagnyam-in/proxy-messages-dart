import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

import 'proxy_subject.dart';

part 'proxy_subject_details_request.g.dart';

@JsonSerializable()
class ProxySubjectDetailsRequest extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final SignedMessage<ProxySubject> proxySubject;

  ProxySubjectDetailsRequest({
    @required this.proxySubject,
  }) {
    assertValid();
  }

  @override
  Set<ProxyId> getValidSigners() {
    return {ownerProxyId, relyingPartyProxyId};
  }

  @override
  String toReadableString() {
    return null;
  }

  @override
  bool isValid() {
    return isValidProxyObject(proxySubject);
  }

  @override
  void assertValid() {
    assertValidProxyObject(proxySubject);
  }

  static SignedMessage<ProxySubjectDetailsRequest> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<ProxySubjectDetailsRequest> signedMessage = SignedMessage.fromJson<ProxySubjectDetailsRequest>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  static ProxySubjectDetailsRequest fromJson(Map json) => _$ProxySubjectDetailsRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProxySubjectDetailsRequestToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [proxySubject];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.identity.ProxySubjectDetailsRequest";

  ProxyId get identityProviderProxyId => proxySubject.message.identityProviderProxyId;

  ProxyId get relyingPartyProxyId => proxySubject.message.relyingPartyProxyId;

  ProxyId get ownerProxyId => proxySubject.message.ownerProxyId;
}
