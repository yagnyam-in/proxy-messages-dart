import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/payments/payment_authorization.dart';
import 'package:proxy_messages/src/banking/payments/payment_authorization_status_request.dart';

part 'payment_authorization_status_response.g.dart';

@JsonSerializable()
class PaymentAuthorizationStatusResponse extends SignableMessage with ProxyUtils {

  @JsonKey(nullable: false, fromJson: PaymentAuthorizationStatusRequest.signedMessageFromJson)
  final SignedMessage<PaymentAuthorizationStatusRequest> request;

  @JsonKey(nullable: false)
  final PaymentAuthorizationStatusEnum paymentAuthorizationStatus;

  PaymentAuthorizationStatusResponse({
    @required this.request,
    @required this.paymentAuthorizationStatus,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isValidProxyObject(request) && paymentAuthorizationStatus != null;
  }

  @override
  void assertValid() {
    assert(request != null);
    request.assertValid();
    assert(paymentAuthorizationStatus != null);
  }

  @override
  ProxyId getSigner() {
     return request.message.payerBankProxyId;
  }

  @override
  List<SignedMessage<SignableMessage>> getChildMessages() {
    return [request];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.payments.PaymentAuthorizationStatusResponse";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$PaymentAuthorizationStatusResponseToJson(this);

  static PaymentAuthorizationStatusResponse fromJson(Map<String, dynamic> json) => _$PaymentAuthorizationStatusResponseFromJson(json);

  static SignedMessage<PaymentAuthorizationStatusResponse> signedMessageFromJson(Map<String, dynamic> json) {
    SignedMessage<PaymentAuthorizationStatusResponse> signed = SignedMessage.fromJson<PaymentAuthorizationStatusResponse>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }
}
