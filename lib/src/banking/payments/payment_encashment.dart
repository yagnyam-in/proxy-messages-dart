import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';
import 'package:proxy_messages/src/banking/payments/payment_authorization.dart';
import 'package:proxy_messages/src/banking/proxy_account.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

part 'payment_encashment.g.dart';

enum PaymentEncashmentStatusEnum {
  Created,
  Registered,
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
class PaymentEncashment extends SignableRequestMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final String paymentEncashmentId;

  @JsonKey(nullable: false, fromJson: PaymentAuthorization.signedMessageFromJson)
  final SignedMessage<PaymentAuthorization> paymentAuthorization;

  @JsonKey(nullable: false, fromJson: ProxyAccount.signedMessageFromJson)
  final SignedMessage<ProxyAccount> payeeAccount;

  @JsonKey(nullable: true)
  final String secret;

  PaymentEncashment({
    @required this.paymentEncashmentId,
    @required this.paymentAuthorization,
    @required this.payeeAccount,
    this.secret,
  }) {
    assertValid();
  }

  @override
  void assertValid() {
    assert(isNotEmpty(paymentEncashmentId));
    assert(paymentAuthorization != null);
    paymentAuthorization.assertValid();
    assert(payeeAccount != null);
    payeeAccount.assertValid();
  }

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [paymentAuthorization, payeeAccount];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  bool isValid() {
    return isNotEmpty(paymentEncashmentId) &&
        paymentAuthorization != null &&
        paymentAuthorization.isValid() &&
        payeeAccount != null &&
        payeeAccount.isValid();
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.payments.PaymentEncashment";

  @override
  String get requestId => paymentEncashmentId;

  @override
  ProxyId getSigner() {
    return payeeId;
  }

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$PaymentEncashmentToJson(this);

  static PaymentEncashment fromJson(Map json) => _$PaymentEncashmentFromJson(json);

  static SignedMessage<PaymentEncashment> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<PaymentEncashment> signed = SignedMessage.fromJson<PaymentEncashment>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }

  SignedMessage<ProxyAccount> get payerAccount {
    return paymentAuthorization.message.proxyAccount;
  }

  ProxyId get payerId {
    return payerAccount.message.ownerProxyId;
  }

  ProxyAccountId get payerAccountId {
    return payerAccount.message.proxyAccountId;
  }

  String get currency {
    return payerAccount.message.currency;
  }

  String get proxyUniverse {
    return payerAccount.message.proxyUniverse;
  }

  ProxyId get payerBankProxyId {
    return payerAccount.signedBy;
  }

  ProxyId get payeeId {
    return payeeAccount.message.ownerProxyId;
  }

  ProxyAccountId get payeeAccountId {
    return payeeAccount.message.proxyAccountId;
  }

  ProxyId get payeeBankProxyId {
    return payeeAccount.signedBy;
  }

  String get paymentAuthorizationId {
    return paymentAuthorization.message.paymentAuthorizationId;
  }

  Amount get amount {
    return paymentAuthorization.message.amount;
  }
}
