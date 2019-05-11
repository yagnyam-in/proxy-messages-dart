import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';

part 'deposit_request_status_response.g.dart';

@JsonSerializable()
class DepositRequestStatusResponse extends SignableMessage with ProxyUtils {
  /**
   * Original Request Message
   */
  @JsonKey(nullable: false, fromJson: DepositRequestStatusRequest.signedMessageFromJson)
  final SignedMessage<DepositRequestStatusRequest> request;

  /**
   * Status of the Deposit
   */
  @JsonKey(nullable: false)
  final DepositStatusEnum status;

  DepositRequestStatusResponse({
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
  String get messageType => "in.yagnyam.proxy.messages.banking.DepositRequestStatusResponse";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$DepositRequestStatusResponseToJson(this);

  static DepositRequestStatusResponse fromJson(Map<String, dynamic> json) => _$DepositRequestStatusResponseFromJson(json);

  static SignedMessage<DepositRequestStatusResponse> signedMessageFromJson(Map<String, dynamic> json) {
    SignedMessage<DepositRequestStatusResponse> signed = SignedMessage.fromJson<DepositRequestStatusResponse>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }
}
