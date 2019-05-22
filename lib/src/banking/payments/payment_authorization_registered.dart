import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/payments/payment_authorization.dart';

part 'payment_authorization_registered.g.dart';

@JsonSerializable()
class PaymentAuthorizationRegistered extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false, fromJson: PaymentAuthorization.signedMessageFromJson)
  final SignedMessage<PaymentAuthorization> paymentAuthorization;

  @JsonKey(nullable: false)
  final PaymentStatusEnum paymentStatus;

  PaymentAuthorizationRegistered({
    @required this.paymentAuthorization,
    @required this.paymentStatus,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isValidProxyObject(paymentAuthorization) && paymentStatus != null;
  }

  @override
  void assertValid() {
    assert(paymentAuthorization != null);
    paymentAuthorization.assertValid();
    assert(paymentStatus != null);
  }

  @override
  ProxyId getSigner() {
    return paymentAuthorization.message.proxyAccount.signedBy;
  }

  @override
  List<SignedMessage<SignableMessage>> getChildMessages() {
    return [paymentAuthorization];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.payments.PaymentAuthorizationRegistered";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$PaymentAuthorizationRegisteredToJson(this);
  static PaymentAuthorizationRegistered fromJson(Map<String, dynamic> json) => _$PaymentAuthorizationRegisteredFromJson(json);

  static SignedMessage<PaymentAuthorizationRegistered> signedMessageFromJson(Map<String, dynamic> json) {
    SignedMessage<PaymentAuthorizationRegistered> signed = SignedMessage.fromJson<PaymentAuthorizationRegistered>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }

}
