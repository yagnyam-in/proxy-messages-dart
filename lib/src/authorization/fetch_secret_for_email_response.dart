import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/authorization/fetch_secret_for_email_request.dart';

part 'fetch_secret_for_email_response.g.dart';

@JsonSerializable()
class FetchSecretForEmailResponse extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false, fromJson: FetchSecretForEmailRequest.signedMessageFromJson)
  final SignedMessage<FetchSecretForEmailRequest> request;

  @JsonKey(nullable: false)
  final String secret;

  FetchSecretForEmailResponse({
    @required this.request,
    @required this.secret,
  }) {
    assertValid();
  }

  @override
  ProxyId getSigner() {
    return authorizerProxyId;
  }

  @override
  String toReadableString() {
    return null;
  }

  @override
  bool isValid() {
    return isValidProxyObject(request) && isNotEmpty(secret);
  }

  @override
  void assertValid() {
    assertValidProxyObject(request);
    assertNotEmpty(secret);
  }

  static FetchSecretForEmailResponse fromJson(Map json) => _$FetchSecretForEmailResponseFromJson(json);

  static SignedMessage<FetchSecretForEmailResponse> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<FetchSecretForEmailResponse> signedMessage =
        SignedMessage.fromJson<FetchSecretForEmailResponse>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$FetchSecretForEmailResponseToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [request];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.authorization.FetchSecretForEmailResponse";

  ProxyId get requesterProxyId => request.message.requesterProxyId;

  String get email => request.message.email;

  ProxyId get authorizerProxyId => request.message.authorizerProxyId;
}
