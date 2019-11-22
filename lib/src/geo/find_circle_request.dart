import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/geo/geo_point.dart';

part 'find_circle_request.g.dart';

@JsonSerializable()
class FindCircleRequest extends SignableRequestMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final String requestId;

  @JsonKey(nullable: false)
  final ProxyId serviceProviderProxyId;

  @JsonKey(nullable: false)
  final GeoPoint geoLocation;

  @JsonKey(nullable: false)
  final ProxyId requesterProxyId;

  FindCircleRequest({
    @required this.requestId,
    @required this.serviceProviderProxyId,
    @required this.geoLocation,
    @required this.requesterProxyId,
  }) {
    assertValid();
  }

  @override
  ProxyId getSigner() {
    return requesterProxyId;
  }

  @override
  String toReadableString() {
    return null;
  }

  @override
  bool isValid() {
    return isValidProxyId(serviceProviderProxyId) &&
        isValidProxyId(requesterProxyId) &&
        isNotEmpty(requestId) &&
        isValidProxyObject(geoLocation);
  }

  @override
  void assertValid() {
    assertValidProxyId(serviceProviderProxyId);
    assertValidProxyId(requesterProxyId);
    assertNotEmpty(requestId);
    assertValidProxyObject(geoLocation);
  }

  static SignedMessage<FindCircleRequest> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<FindCircleRequest> signedMessage = SignedMessage.fromJson<FindCircleRequest>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  static FindCircleRequest fromJson(Map json) => _$FindCircleRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FindCircleRequestToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.geo.FindCircleRequest";
}
