import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/withdrawal.dart';

part 'withdrawal_status.g.dart';

@JsonSerializable()
class WithdrawalStatus extends SignableMessage with ProxyUtils {
  /**
   * Original Request Message
   */
  @JsonKey(nullable: false, fromJson: Withdrawal.signedMessageFromJson)
  final SignedMessage<Withdrawal> request;

  /**
   * Status of the request
   */
  @JsonKey(nullable: false)
  final WithdrawalStatusEnum status;

  WithdrawalStatus({
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
    assert(request != null);
    request.assertValid();
    assert(status != null);
  }

  @override
  ProxyId getSigner() {
    return request.message.proxyAccount.signedBy;
  }

  @override
  List<SignedMessage<SignableMessage>> getChildMessages() {
    return [request];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.banking.WithdrawalStatus";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$WithdrawalStatusToJson(this);
  static WithdrawalStatus fromJson(Map<String, dynamic> json) => _$WithdrawalStatusFromJson(json);

  static SignedMessage<WithdrawalStatus> signedMessageFromJson(Map<String, dynamic> json) {
    SignedMessage<WithdrawalStatus> signed = SignedMessage.fromJson<WithdrawalStatus>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }

}
