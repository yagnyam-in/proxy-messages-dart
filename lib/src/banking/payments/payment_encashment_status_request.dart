import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/payments.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

part 'payment_encashment_status_request.g.dart';

@JsonSerializable()
class PaymentEncashmentStatusRequest extends SignableRequestMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final String requestId;

  @JsonKey(nullable: false, fromJson: PaymentEncashment.signedMessageFromJson)
  final SignedMessage<PaymentEncashment> paymentEncashment;

  PaymentEncashmentStatusRequest({
    @required this.requestId,
    @required this.paymentEncashment,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isNotEmpty(requestId) && isValidProxyObject(paymentEncashment);
  }

  @override
  void assertValid() {
    assert(isNotEmpty(requestId));
    assert(paymentEncashment != null);
    paymentEncashment.assertValid();
  }

  @override
  ProxyId getSigner() {
    return payeeId;
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
  String get messageType => "in.yagnyam.proxy.messages.payments.PaymentEncashmentStatusRequest";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$PaymentEncashmentStatusRequestToJson(this);

  static PaymentEncashmentStatusRequest fromJson(Map json) => _$PaymentEncashmentStatusRequestFromJson(json);

  static SignedMessage<PaymentEncashmentStatusRequest> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<PaymentEncashmentStatusRequest> signed = SignedMessage.fromJson<PaymentEncashmentStatusRequest>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }

  String get paymentAuthorizationId {
    return paymentEncashment.message.paymentAuthorizationId;
  }

  String get paymentEncashmentId {
    return paymentEncashment.message.paymentEncashmentId;
  }

  ProxyAccountId get payerAccountId {
    return paymentEncashment.message.payerAccountId;
  }

  ProxyId get payerId {
    return paymentEncashment.message.payerId;
  }

  ProxyAccountId get payeeAccountId {
    return paymentEncashment.message.payeeAccountId;
  }

  ProxyId get payeeId {
    return paymentEncashment.message.payeeId;
  }

  String get proxyUniverse {
    return paymentEncashment.message.proxyUniverse;
  }

  ProxyId get payerBankProxyId {
    return paymentEncashment.message.payerBankProxyId;
  }
}
