import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/escrow/escrow_account.dart';

import 'escrow_account_details_request.dart';

part 'escrow_account_details_response.g.dart';

@JsonSerializable()
class EscrowAccountDetailsResponse extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false, fromJson: EscrowAccountDetailsRequest.signedMessageFromJson)
  final SignedMessage<EscrowAccountDetailsRequest> request;

  @JsonKey(nullable: false)
  final EscrowAccountStatusEnum status;

  EscrowAccountDetailsResponse({
    @required this.request,
    @required this.status,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isValidProxyObject(request) && status != null;
  }

  @override
  void assertValid() {
    assertValidProxyObject(request);
    assert(status != null);
  }

  @override
  ProxyId getSigner() {
    return request.message.escrowAccount.message.bankProxyId;
  }

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [request];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.escrow.EscrowAccountDetailsResponse";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$EscrowAccountDetailsResponseToJson(this);

  static EscrowAccountDetailsResponse fromJson(Map json) => _$EscrowAccountDetailsResponseFromJson(json);

  static SignedMessage<EscrowAccountDetailsResponse> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<EscrowAccountDetailsResponse> signedMessage =
        SignedMessage.fromJson<EscrowAccountDetailsResponse>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }
}
