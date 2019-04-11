import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';

part 'deposit_status_response.g.dart';

@JsonSerializable()
class DepositStatusResponse extends SignableMessage with ProxyUtils {
  /**
   * Original Request Message
   */
  @JsonKey(nullable: false, fromJson: DepositStatusRequest.signedMessageFromJson)
  final SignedMessage<DepositStatusRequest> request;

  /**
   * Status of the Deposit
   */
  @JsonKey(nullable: false)
  final DepositStatusEnum status;

  DepositStatusResponse({
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
    DepositRequest deposit = request.message.request.message;
    return deposit.proxyAccount.signedBy;
  }

  @override
  List<SignedMessage<SignableMessage>> getChildMessages() {
    return [request];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.banking.DepositStatusResponse";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$DepositStatusResponseToJson(this);

  static DepositStatusResponse fromJson(Map<String, dynamic> json) => _$DepositStatusResponseFromJson(json);

  static SignedMessage<DepositStatusResponse> signedMessageFromJson(Map<String, dynamic> json) {
    SignedMessage<DepositStatusResponse> signed = SignedMessage.fromJson<DepositStatusResponse>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }
}
