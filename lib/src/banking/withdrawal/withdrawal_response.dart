import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/withdrawal/withdrawal.dart';

part 'withdrawal_response.g.dart';

@JsonSerializable()
class WithdrawalResponse extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false, fromJson: Withdrawal.signedMessageFromJson)
  final SignedMessage<Withdrawal> request;

  @JsonKey(nullable: false)
  final WithdrawalStatusEnum status;

  WithdrawalResponse({
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
  String get messageType =>
      "in.yagnyam.proxy.messages.banking.WithdrawalResponse";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$WithdrawalResponseToJson(this);

  static WithdrawalResponse fromJson(Map<String, dynamic> json) =>
      _$WithdrawalResponseFromJson(json);

  static SignedMessage<WithdrawalResponse> signedMessageFromJson(
      Map<String, dynamic> json) {
    SignedMessage<WithdrawalResponse> signed =
        SignedMessage.fromJson<WithdrawalResponse>(json);
    signed.message = MessageBuilder.instance()
        .buildSignableMessage(signed.payload, fromJson);
    return signed;
  }
}
