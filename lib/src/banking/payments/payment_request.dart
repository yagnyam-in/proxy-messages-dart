import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/amount.dart';
import 'package:proxy_messages/src/banking/proxy_account.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

part 'payment_request.g.dart';

enum PaymentRequestStatusEnum {
  Created,
  Requested,
  Rejected,
  InsufficientFunds,
  CancelledByPayer,
  CancelledByPayee,
  InProcess,
  Processed,
  Expired,
  Error,
}

@JsonSerializable()
class PaymentRequest extends SignableRequestMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final String paymentRequestId;

  @JsonKey(nullable: false, fromJson: ProxyAccount.signedMessageFromJson)
  final SignedMessage<ProxyAccount> proxyAccount;

  @JsonKey(nullable: false)
  final Amount amount;

  final String description;

  final String transaction;

  PaymentRequest({
    @required this.paymentRequestId,
    @required this.proxyAccount,
    @required this.amount,
    @required this.description,
    @required this.transaction,
  }) {
    assertValid();
  }

  @override
  void assertValid() {
    assertNotEmpty(paymentRequestId);
    assertValidProxyObject(proxyAccount);
    assertValidProxyObject(amount);
  }

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [proxyAccount];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  bool isValid() {
    return isNotEmpty(paymentRequestId) && isValidProxyObject(proxyAccount) && isValidProxyObject(amount);
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.payments.PaymentRequest";

  @override
  String get requestId => paymentRequestId;

  @override
  ProxyId getSigner() {
    return payerId;
  }

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$PaymentRequestToJson(this);

  static PaymentRequest fromJson(Map json) => _$PaymentRequestFromJson(json);

  static SignedMessage<PaymentRequest> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<PaymentRequest> signed = SignedMessage.fromJson<PaymentRequest>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }

  ProxyId get payerId {
    return proxyAccount.message.ownerProxyId;
  }

  ProxyAccountId get payerAccountId {
    return proxyAccount.message.proxyAccountId;
  }

  String get currency {
    return proxyAccount.message.currency;
  }

  ProxyId get payerBankProxyId {
    return proxyAccount.signedBy;
  }
}
