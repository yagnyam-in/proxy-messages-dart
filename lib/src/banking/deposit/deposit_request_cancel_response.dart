import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';

part 'deposit_request_cancel_response.g.dart';

@JsonSerializable()
class DepositRequestCancelResponse extends SignableMessage with ProxyUtils {
  /**
   * Original Request Message
   */
  @JsonKey(nullable: false, fromJson: DepositRequestCancelRequest.signedMessageFromJson)
  final SignedMessage<DepositRequestCancelRequest> request;

  /**
   * Status of the Deposit
   */
  @JsonKey(nullable: false)
  final DepositStatusEnum status;

  DepositRequestCancelResponse({
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
     return request.message.depositRequest.signedBy;
  }

  @override
  List<SignedMessage<SignableMessage>> getChildMessages() {
    return [request];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.banking.DepositRequestCancelResponse";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$DepositRequestCancelResponseToJson(this);

  static DepositRequestCancelResponse fromJson(Map<String, dynamic> json) => _$DepositRequestCancelResponseFromJson(json);

  static SignedMessage<DepositRequestCancelResponse> signedMessageFromJson(Map<String, dynamic> json) {
    SignedMessage<DepositRequestCancelResponse> signed = SignedMessage.fromJson<DepositRequestCancelResponse>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }
}
