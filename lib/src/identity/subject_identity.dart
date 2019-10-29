import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

import 'subject_details.dart';

part 'subject_identity.g.dart';

@JsonSerializable()
class SubjectIdentity extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final ProxyId identityProviderProxyId;

  @JsonKey(nullable: false)
  final SubjectIdTypeEnum subjectIdType;

  @JsonKey(nullable: false)
  final String subjectId;

  @JsonKey(nullable: false)
  final ProxyId ownerProxyId;

  @JsonKey(nullable: false)
  final DateTime creationDate;

  @JsonKey(nullable: false)
  final DateTime expiryDate;

  @JsonKey(nullable: false)
  final SubjectDetails subjectDetails;

  SubjectIdentity({
    @required this.identityProviderProxyId,
    @required this.subjectIdType,
    @required this.subjectId,
    @required this.ownerProxyId,
    @required this.creationDate,
    @required this.expiryDate,
    @required this.subjectDetails,
  }) {
    assertValid();
  }

  @override
  ProxyId getSigner() {
    return identityProviderProxyId;
  }

  @override
  String toReadableString() {
    return null;
  }

  @override
  bool isValid() {
    return isValidProxyId(identityProviderProxyId) &&
        subjectIdType != null &&
        isNotEmpty(subjectId) &&
        isValidProxyId(ownerProxyId) &&
        isValidDateTime(creationDate) &&
        isValidDateTime(expiryDate) &&
        isValidProxyObject(subjectDetails);
  }

  @override
  void assertValid() {
    assertValidProxyId(identityProviderProxyId);
    assert(subjectIdType != null);
    assertNotEmpty(subjectId);
    assertValidProxyId(ownerProxyId);
    assertValidDateTime(creationDate);
    assertValidDateTime(expiryDate);
    assertValidProxyObject(subjectDetails);
  }

  static SignedMessage<SubjectIdentity> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<SubjectIdentity> signedMessage = SignedMessage.fromJson<SubjectIdentity>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  static SubjectIdentity fromJson(Map json) => _$SubjectIdentityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SubjectIdentityToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.identity.SubjectIdentity";
}
