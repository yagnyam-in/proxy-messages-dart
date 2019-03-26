import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/withdrawal.dart';

part 'withdrawal_status_request.g.dart';

@JsonSerializable()
class WithdrawalStatusRequest extends SignableMessage with ProxyUtils {
  /**
   * Original Request Message
   */
  @JsonKey(nullable: false, fromJson: Withdrawal.signedMessageFromJson)
  final SignedMessage<Withdrawal> request;

  WithdrawalStatusRequest({
    @required this.request,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isValidProxyObject(request);
  }

  @override
  void assertValid() {
    assert(request != null);
    request.assertValid();
  }

  @override
  ProxyId getSigner() {
    return request.signedBy;
  }

  @override
  List<SignedMessage<SignableMessage>> getChildMessages() {
    return [request];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.banking.WithdrawalStatusRequest";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$WithdrawalStatusRequestToJson(this);
  static WithdrawalStatusRequest fromJson(Map<String, dynamic> json) => _$WithdrawalStatusRequestFromJson(json);

  static SignedMessage<WithdrawalStatusRequest> signedMessageFromJson(Map<String, dynamic> json) {
    SignedMessage<WithdrawalStatusRequest> signed = SignedMessage.fromJson<WithdrawalStatusRequest>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }

}
