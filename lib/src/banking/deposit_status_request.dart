import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/deposit_request.dart';
import 'package:proxy_messages/src/banking/withdrawal.dart';

part 'deposit_status_request.g.dart';

@JsonSerializable()
class DepositStatusRequest extends SignableRequestMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final String requestId;

  /**
   * Original Request Message
   */
  @JsonKey(nullable: false, fromJson: DepositRequest.signedMessageFromJson)
  final SignedMessage<DepositRequest> request;

  DepositStatusRequest({
    @required this.requestId,
    @required this.request,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isNotEmpty(requestId) && isValidProxyObject(request);
  }

  @override
  void assertValid() {
    assert(requestId != null);
    assert(isNotEmpty(requestId));
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
  String get messageType => "in.yagnyam.proxy.messages.banking.DepositStatusRequest";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$DepositStatusRequestToJson(this);

  static DepositStatusRequest fromJson(Map<String, dynamic> json) => _$DepositStatusRequestFromJson(json);

  static SignedMessage<DepositStatusRequest> signedMessageFromJson(Map<String, dynamic> json) {
    SignedMessage<DepositStatusRequest> signed = SignedMessage.fromJson<DepositStatusRequest>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }
}
