import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

import 'find_circle_session_id.dart';

part 'find_circle_session.g.dart';

@JsonSerializable()
class FindCircleSession extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final FindCircleSessionId sessionId;

  @JsonKey(nullable: false)
  final ProxyId requesterProxyId;

  @JsonKey(nullable: true)
  final String alertLocation;

  @JsonKey(nullable: false)
  final DateTime creationDate;

  @JsonKey(nullable: false)
  final DateTime expiryDate;

  FindCircleSession({
    @required this.sessionId,
    @required this.requesterProxyId,
    @required this.creationDate,
    @required this.expiryDate,
    this.alertLocation,
  }) {
    assertValid();
  }

  @override
  ProxyId getSigner() {
    return sessionId.serviceProviderId;
  }

  @override
  String toReadableString() {
    return null;
  }

  @override
  bool isValid() {
    return isValidProxyObject(sessionId) &&
        isValidProxyObject(requesterProxyId) &&
        isValidDateTime(creationDate) &&
        isValidDateTime(expiryDate);
  }

  @override
  void assertValid() {
    assertValidProxyObject(sessionId);
    isValidProxyObject(requesterProxyId);
    assertValidDateTime(creationDate);
    assertValidDateTime(expiryDate);
  }

  static SignedMessage<FindCircleSession> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<FindCircleSession> signedMessage = SignedMessage.fromJson<FindCircleSession>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  static FindCircleSession fromJson(Map json) => _$FindCircleSessionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FindCircleSessionToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.geo.FindCircleSession";
}
