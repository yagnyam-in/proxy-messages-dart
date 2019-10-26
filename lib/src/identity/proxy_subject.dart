import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

import 'proxy_subject_id.dart';
import 'subject_details.dart';

part 'proxy_subject.g.dart';

@JsonSerializable()
class ProxySubject extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final ProxySubjectId proxySubjectId;

  @JsonKey(nullable: false)
  final ProxyId ownerProxyId;

  @JsonKey(nullable: false)
  final DateTime creationDate;

  @JsonKey(nullable: false)
  final DateTime expiryDate;

  @JsonKey(nullable: false)
  final SubjectDetails subjectDetails;

  ProxySubject({
    @required this.proxySubjectId,
    @required this.ownerProxyId,
    @required this.creationDate,
    @required this.expiryDate,
    @required this.subjectDetails,
  }) {
    assertValid();
  }

  @override
  ProxyId getSigner() {
    return proxySubjectId.issuerProxyId;
  }

  @override
  String toReadableString() {
    return null;
  }

  @override
  bool isValid() {
    return isValidProxyObject(proxySubjectId) &&
        isValidProxyId(ownerProxyId) &&
        isValidDateTime(creationDate) &&
        isValidDateTime(expiryDate) &&
        isValidProxyObject(subjectDetails);
  }

  @override
  void assertValid() {
    assertValidProxyObject(proxySubjectId);
    assertValidProxyId(ownerProxyId);
    assertValidDateTime(creationDate);
    assertValidDateTime(expiryDate);
    assertValidProxyObject(subjectDetails);
  }

  static SignedMessage<ProxySubject> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<ProxySubject> signedMessage = SignedMessage.fromJson<ProxySubject>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  static ProxySubject fromJson(Map json) => _$ProxySubjectFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProxySubjectToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.identity.ProxySubject";

  ProxyId get issuerProxyId => proxySubjectId.issuerProxyId;

  String get proxyUniverse => proxySubjectId.proxyUniverse;
}
