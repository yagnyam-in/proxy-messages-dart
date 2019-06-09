import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/payments/payment_authorization.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

part 'payment_authorization_status_request.g.dart';

@JsonSerializable()
class PaymentAuthorizationStatusRequest extends SignableRequestMessage
    with ProxyUtils {
  @JsonKey(nullable: false)
  final String requestId;

  @JsonKey(
      nullable: false, fromJson: PaymentAuthorization.signedMessageFromJson)
  final SignedMessage<PaymentAuthorization> paymentAuthorization;

  PaymentAuthorizationStatusRequest({
    @required this.requestId,
    @required this.paymentAuthorization,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isNotEmpty(requestId) && isValidProxyObject(paymentAuthorization);
  }

  @override
  void assertValid() {
    assert(isNotEmpty(requestId));
    assert(paymentAuthorization != null);
    paymentAuthorization.assertValid();
  }

  @override
  ProxyId getSigner() {
    return payerId;
  }

  @override
  List<SignedMessage<SignableMessage>> getChildMessages() {
    return [paymentAuthorization];
  }

  @override
  String get messageType =>
      "in.yagnyam.proxy.messages.payments.PaymentAuthorizationStatusRequest";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() =>
      _$PaymentAuthorizationStatusRequestToJson(this);

  static PaymentAuthorizationStatusRequest fromJson(
          Map json) =>
      _$PaymentAuthorizationStatusRequestFromJson(json);

  static SignedMessage<PaymentAuthorizationStatusRequest> signedMessageFromJson(
      Map json) {
    SignedMessage<PaymentAuthorizationStatusRequest> signed =
        SignedMessage.fromJson<PaymentAuthorizationStatusRequest>(json);
    signed.message = MessageBuilder.instance()
        .buildSignableMessage(signed.payload, fromJson);
    return signed;
  }

  String get paymentAuthorizationId {
    return paymentAuthorization.message.paymentAuthorizationId;
  }

  ProxyAccountId get payerAccountId {
    return paymentAuthorization.message.payerAccountId;
  }

  ProxyId get payerId {
    return paymentAuthorization.message.payerId;
  }

  String get proxyUniverse {
    return paymentAuthorization.message.proxyUniverse;
  }

  ProxyId get payerBankProxyId {
    return paymentAuthorization.message.payerBankProxyId;
  }
}
