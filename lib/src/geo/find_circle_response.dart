import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

import 'find_circle_request.dart';
import 'find_circle_session.dart';

part 'find_circle_response.g.dart';

@JsonSerializable()
class FindCircleResponse extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final SignedMessage<FindCircleRequest> request;

  @JsonKey(nullable: false)
  final SignedMessage<FindCircleSession> session;

  FindCircleResponse({
    @required this.request,
    @required this.session,
  }) {
    assertValid();
  }

  @override
  ProxyId getSigner() {
    return request.message.serviceProviderProxyId;
  }

  @override
  String toReadableString() {
    return null;
  }

  @override
  bool isValid() {
    return isValidProxyObject(request) && isValidProxyObject(session);
  }

  @override
  void assertValid() {
    assertValidProxyObject(request);
    assertValidProxyObject(session);
  }

  static SignedMessage<FindCircleResponse> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<FindCircleResponse> signedMessage = SignedMessage.fromJson<FindCircleResponse>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  static FindCircleResponse fromJson(Map json) => _$FindCircleResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FindCircleResponseToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [request, session];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.geo.FindCircleResponse";
}
