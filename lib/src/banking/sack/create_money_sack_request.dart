import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';

part 'create_money_sack_request.g.dart';

@JsonSerializable()
class CreateMoneySackRequest extends SignableRequestMessage with ProxyUtils {

  @JsonKey(nullable: false)
  final String requestId;

  @JsonKey(nullable: false, fromJson: ProxyAccount.signedMessageFromJson)
  final SignedMessage<ProxyAccount> debitProxyAccount;

  @JsonKey(nullable: false)
  final Amount amount;

  CreateMoneySackRequest({
    @required this.requestId,
    @required this.debitProxyAccount,
    @required this.amount,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isNotEmpty(requestId) &&
        isValidProxyObject(debitProxyAccount) &&
        isValidProxyObject(amount);
  }

  @override
  void assertValid() {
    assertNotEmpty(requestId);
    assertValidProxyObject(debitProxyAccount);
    assertValidProxyObject(amount);
  }

  @override
  ProxyId getSigner() {
    return debitProxyAccount.message.ownerProxyId;
  }

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [debitProxyAccount];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.sack.CreateMoneySackRequest";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$CreateMoneySackRequestToJson(this);

  static CreateMoneySackRequest fromJson(Map json) => _$CreateMoneySackRequestFromJson(json);

  static SignedMessage<CreateMoneySackRequest> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<CreateMoneySackRequest> signedMessage = SignedMessage.fromJson<CreateMoneySackRequest>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }
}
