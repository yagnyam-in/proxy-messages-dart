import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/amount.dart';
import 'package:proxy_messages/src/banking/payments/payee.dart';
import 'package:proxy_messages/src/banking/proxy_account.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

part 'payment_authorization.g.dart';

enum PaymentAuthorizationStatusEnum {
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
class PaymentAuthorization extends SignableRequestMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final String paymentAuthorizationId;

  @JsonKey(nullable: false, fromJson: ProxyAccount.signedMessageFromJson)
  final SignedMessage<ProxyAccount> proxyAccount;

  @JsonKey(nullable: false)
  final Amount amount;

  @JsonKey(nullable: false)
  final List<Payee> payees;

  PaymentAuthorization({
    @required this.paymentAuthorizationId,
    @required this.proxyAccount,
    @required this.amount,
    @required this.payees,
  });

  @override
  void assertValid() {
    assert(isNotEmpty(paymentAuthorizationId));
    assert(proxyAccount != null);
    proxyAccount.assertValid();
    assert(amount != null);
    amount.assertValid();
    assert(payees != null);
    assert(payees.isNotEmpty);
    assert(payees.map((p) => p.paymentEncashmentId).toSet().length ==
        payees.length);
    payees.forEach((p) => p.assertValid());
  }

  @override
  List<SignedMessage<SignableMessage>> getChildMessages() {
    return [proxyAccount];
  }

  @override
  bool isValid() {
    return isNotEmpty(paymentAuthorizationId) &&
        proxyAccount != null &&
        proxyAccount.isValid() &&
        amount != null &&
        amount.isValid() &&
        payees != null &&
        payees.isNotEmpty &&
        payees.map((p) => p.paymentEncashmentId).toSet().length ==
            payees.length &&
        payees.every((p) => p.isValid());
  }

  @override
  String get messageType =>
      "in.yagnyam.proxy.messages.payments.PaymentAuthorization";

  @override
  String get requestId => paymentAuthorizationId;

  @override
  ProxyId getSigner() {
    return payerId;
  }

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$PaymentAuthorizationToJson(this);

  static PaymentAuthorization fromJson(Map json) =>
      _$PaymentAuthorizationFromJson(json);

  static SignedMessage<PaymentAuthorization> signedMessageFromJson(
      Map json) {
    SignedMessage<PaymentAuthorization> signed =
        SignedMessage.fromJson<PaymentAuthorization>(json);
    signed.message = MessageBuilder.instance()
        .buildSignableMessage(signed.payload, fromJson);
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

  String get proxyUniverse {
    return proxyAccount.message.proxyUniverse;
  }

  ProxyId get payerBankProxyId {
    return proxyAccount.signedBy;
  }
}
