import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

import 'proxy_subject_details_request.dart';
import 'subject_details.dart';

part 'proxy_subject_details_response.g.dart';

@JsonSerializable()
class ProxySubjectDetailsResponse extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final SignedMessage<ProxySubjectDetailsRequest> request;

  @JsonKey(nullable: false)
  final SubjectDetails subjectDetails;

  ProxySubjectDetailsResponse({
    @required this.request,
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
    return isValidProxyObject(request) && isValidProxyObject(subjectDetails);
  }

  @override
  void assertValid() {
    assertValidProxyObject(request);
    assertValidProxyObject(subjectDetails);
  }

  static SignedMessage<ProxySubjectDetailsResponse> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<ProxySubjectDetailsResponse> signedMessage = SignedMessage.fromJson<ProxySubjectDetailsResponse>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  static ProxySubjectDetailsResponse fromJson(Map json) => _$ProxySubjectDetailsResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProxySubjectDetailsResponseToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [request];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.identity.ProxySubjectDetailsResponse";

  ProxyId get identityProviderProxyId => request.message.identityProviderProxyId;

  ProxyId get relyingPartyProxyId => request.message.relyingPartyProxyId;

  ProxyId get ownerProxyId => request.message.ownerProxyId;
}
