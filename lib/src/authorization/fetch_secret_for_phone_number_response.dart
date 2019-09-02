import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

import 'fetch_secret_for_phone_number_request.dart';

part 'fetch_secret_for_phone_number_response.g.dart';

@JsonSerializable()
class FetchSecretForPhoneNumberResponse extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false, fromJson: FetchSecretForPhoneNumberRequest.signedMessageFromJson)
  final SignedMessage<FetchSecretForPhoneNumberRequest> request;

  @JsonKey(nullable: false)
  final String secret;

  FetchSecretForPhoneNumberResponse({
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

  static FetchSecretForPhoneNumberResponse fromJson(Map json) => _$FetchSecretForPhoneNumberResponseFromJson(json);

  static SignedMessage<FetchSecretForPhoneNumberResponse> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<FetchSecretForPhoneNumberResponse> signedMessage =
        SignedMessage.fromJson<FetchSecretForPhoneNumberResponse>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$FetchSecretForPhoneNumberResponseToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [request];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.authorization.FetchSecretForPhoneNumberResponse";

  ProxyId get requesterProxyId => request.message.requesterProxyId;

  String get phoneNumber => request.message.phoneNumber;

  ProxyId get authorizerProxyId => request.message.authorizerProxyId;
}
