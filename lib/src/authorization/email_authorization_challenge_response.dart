import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/authorization.dart';


part 'email_authorization_challenge_response.g.dart';

@JsonSerializable()
class EmailAuthorizationChallengeResponse extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false, fromJson: EmailAuthorizationChallenge.signedMessageFromJson)
  final SignedMessage<EmailAuthorizationChallenge> challenge;

  @JsonKey(nullable: false)
  final String response;

  EmailAuthorizationChallengeResponse({
    @required this.challenge,
    @required this.response,
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
    return isValidProxyObject(challenge) && isNotEmpty(response);
  }

  @override
  void assertValid() {
    assertValidProxyObject(challenge);
    assertNotEmpty(response);
  }

  static EmailAuthorizationChallengeResponse fromJson(Map json) => _$EmailAuthorizationChallengeResponseFromJson(json);

  static SignedMessage<EmailAuthorizationChallengeResponse> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<EmailAuthorizationChallengeResponse> signedMessage =
        SignedMessage.fromJson<EmailAuthorizationChallengeResponse>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$EmailAuthorizationChallengeResponseToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [challenge];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.authorization.EmailAuthorizationChallengeResponse";

  ProxyId get requesterProxyId => challenge.message.requesterProxyId;

  String get email => challenge.message.email;

  ProxyId get authorizerProxyId => challenge.message.authorizerProxyId;


}
