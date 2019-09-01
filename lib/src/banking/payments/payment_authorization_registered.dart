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
  final PaymentAuthorizationStatusEnum paymentAuthorizationStatus;

  PaymentAuthorizationRegistered({
    @required this.paymentAuthorization,
    @required this.paymentAuthorizationStatus,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isValidProxyObject(paymentAuthorization) && paymentAuthorizationStatus != null;
  }

  @override
  void assertValid() {
    assert(paymentAuthorization != null);
    paymentAuthorization.assertValid();
    assert(paymentAuthorizationStatus != null);
  }

  @override
  ProxyId getSigner() {
    return paymentAuthorization.message.proxyAccount.signedBy;
  }

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [paymentAuthorization];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.payments.PaymentAuthorizationRegistered";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$PaymentAuthorizationRegisteredToJson(this);

  static PaymentAuthorizationRegistered fromJson(Map json) => _$PaymentAuthorizationRegisteredFromJson(json);

  static SignedMessage<PaymentAuthorizationRegistered> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<PaymentAuthorizationRegistered> signed = SignedMessage.fromJson<PaymentAuthorizationRegistered>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }
}
