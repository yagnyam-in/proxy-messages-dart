import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/payments/payment_encashment.dart';

part 'payment_encashment_registered.g.dart';

@JsonSerializable()
class PaymentEncashmentRegistered extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false, fromJson: PaymentEncashment.signedMessageFromJson)
  final SignedMessage<PaymentEncashment> paymentEncashment;

  @JsonKey(nullable: false)
  final PaymentEncashmentStatusEnum paymentEncashmentStatus;

  PaymentEncashmentRegistered({
    @required this.paymentEncashment,
    @required this.paymentEncashmentStatus,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isValidProxyObject(paymentEncashment) && paymentEncashmentStatus != null;
  }

  @override
  void assertValid() {
    assert(paymentEncashment != null);
    paymentEncashment.assertValid();
    assert(paymentEncashmentStatus != null);
  }

  @override
  ProxyId getSigner() {
    return paymentEncashment.message.payerAccount.signedBy;
  }

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [paymentEncashment];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.payments.PaymentEncashmentRegistered";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$PaymentEncashmentRegisteredToJson(this);

  static PaymentEncashmentRegistered fromJson(Map json) => _$PaymentEncashmentRegisteredFromJson(json);

  static SignedMessage<PaymentEncashmentRegistered> signedMessageFromJson(Map json) {
    SignedMessage<PaymentEncashmentRegistered> signed = SignedMessage.fromJson<PaymentEncashmentRegistered>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }
}
