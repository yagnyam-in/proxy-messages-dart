import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';

part 'withdrawal_status_response.g.dart';

@JsonSerializable()
class WithdrawalStatusResponse extends SignableMessage with ProxyUtils {
  /**
   * Original Request Message
   */
  @JsonKey(nullable: false, fromJson: WithdrawalStatusRequest.signedMessageFromJson)
  final SignedMessage<WithdrawalStatusRequest> request;

  /**
   * Status of the withdrawal
   */
  @JsonKey(nullable: false)
  final WithdrawalStatusEnum status;

  WithdrawalStatusResponse({
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
    Withdrawal withdrawal = request.message.request.message;
    return withdrawal.proxyAccount.signedBy;
  }

  @override
  List<SignedMessage<SignableMessage>> getChildMessages() {
    return [request];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.banking.WithdrawalStatusResponse";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$WithdrawalStatusResponseToJson(this);

  static WithdrawalStatusResponse fromJson(Map json) => _$WithdrawalStatusResponseFromJson(json);

  static SignedMessage<WithdrawalStatusResponse> signedMessageFromJson(Map json) {
    SignedMessage<WithdrawalStatusResponse> signed = SignedMessage.fromJson<WithdrawalStatusResponse>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }
}
