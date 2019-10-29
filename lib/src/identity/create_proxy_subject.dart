import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

import 'proxy_subject.dart';
import 'subject_details.dart';

part 'create_proxy_subject.g.dart';

@JsonSerializable()
class CreateProxySubjectRequest extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final String requestId;

  @JsonKey(nullable: false)
  final String relyingPartyId;

  @JsonKey(nullable: false)
  final ProxyId relyingPartyProxyId;

  @JsonKey(nullable: false)
  final SignedMessage<ProxySubject> proxySubject;

  @JsonKey(nullable: false)
  final ProxyId newOwnerProxyId;

  @JsonKey(nullable: false)
  final SubjectDetails subjectDetails;

  CreateProxySubjectRequest({
    @required this.requestId,
    @required this.relyingPartyId,
    @required this.relyingPartyProxyId,
    @required this.proxySubject,
    @required this.newOwnerProxyId,
    @required this.subjectDetails,
  }) {
    assertValid();
  }

  @override
  ProxyId getSigner() {
    return originalOwnerProxyId;
  }

  @override
  String toReadableString() {
    return null;
  }

  @override
  bool isValid() {
    return isNotEmpty(requestId) &&
        isNotEmpty(relyingPartyId) &&
        isValidProxyId(relyingPartyProxyId) &&
        isValidProxyObject(proxySubject) &&
        isValidProxyId(newOwnerProxyId) &&
        isValidProxyObject(subjectDetails);
  }

  @override
  void assertValid() {
    assertNotEmpty(requestId);
    assertNotEmpty(relyingPartyId);
    assertValidProxyId(relyingPartyProxyId);
    assertValidProxyObject(proxySubject);
    assertValidProxyId(newOwnerProxyId);
    assertValidProxyObject(subjectDetails);
  }

  static SignedMessage<CreateProxySubjectRequest> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<CreateProxySubjectRequest> signedMessage = SignedMessage.fromJson<CreateProxySubjectRequest>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  static CreateProxySubjectRequest fromJson(Map json) => _$CreateProxySubjectRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CreateProxySubjectRequestToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [proxySubject];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.identity.CreateProxySubjectRequest";

  ProxyId get identityProviderProxyId => proxySubject.message.identityProviderProxyId;

  ProxyId get originalOwnerProxyId => proxySubject.message.ownerProxyId;
}
