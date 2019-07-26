import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/payments.dart';

part 'payment_encashment_status_response.g.dart';

@JsonSerializable()
class PaymentEncashmentStatusResponse extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false, fromJson: PaymentEncashmentStatusRequest.signedMessageFromJson)
  final SignedMessage<PaymentEncashmentStatusRequest> request;

  @JsonKey(nullable: false)
  final PaymentEncashmentStatusEnum paymentEncashmentStatus;

  PaymentEncashmentStatusResponse({
    @required this.request,
    @required this.paymentEncashmentStatus,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isValidProxyObject(request) && paymentEncashmentStatus != null;
  }

  @override
  void assertValid() {
    assert(request != null);
    request.assertValid();
    assert(paymentEncashmentStatus != null);
  }

  @override
  ProxyId getSigner() {
    return request.message.payerBankProxyId;
  }

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [request];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.payments.PaymentEncashmentStatusResponse";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$PaymentEncashmentStatusResponseToJson(this);

  static PaymentEncashmentStatusResponse fromJson(Map json) => _$PaymentEncashmentStatusResponseFromJson(json);

  static SignedMessage<PaymentEncashmentStatusResponse> signedMessageFromJson(Map json) {
    SignedMessage<PaymentEncashmentStatusResponse> signed =
        SignedMessage.fromJson<PaymentEncashmentStatusResponse>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }
}
