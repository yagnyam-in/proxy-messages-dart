import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/amount.dart';
import 'package:proxy_messages/src/banking/non_proxy_account.dart';
import 'package:proxy_messages/src/banking/proxy_account.dart';

part 'withdrawal.g.dart';


enum WithdrawalStatusEnum {
  Registered,
  Rejected,
  Cancelled,
  InTransit,
  Completed,
  Failed,
}

@JsonSerializable()
class Withdrawal extends SignableRequestMessage with ProxyUtils {

  @JsonKey(nullable: false)
  final String withdrawalId;

  @JsonKey(nullable: false, fromJson: ProxyAccount.signedMessageFromJson)
  final SignedMessage<ProxyAccount> proxyAccount;

  @JsonKey(nullable: false)
  final Amount amount;

  @JsonKey(nullable: false)
  final NonProxyAccount destinationAccount;

  Withdrawal({
    @required this.withdrawalId,
    @required this.proxyAccount,
    @required this.amount,
    this.destinationAccount,
  }) {
    assertValid();
  }

  @override
  void assertValid() {
    assert(isNotEmpty(withdrawalId));
    assert(proxyAccount != null);
    proxyAccount.assertValid();
    assert(amount != null);
    amount.assertValid();
    assert(currency == amount.currency);
    assert(destinationAccount != null);
    destinationAccount.assertValid();
    assert(currency == destinationAccount.currency);
  }

  @override
  ProxyId getSigner() {
    return proxyAccount.message.ownerProxyId;
  }

  @override
  List<SignedMessage<SignableMessage>> getChildMessages() {
    return [proxyAccount];
  }

  @override
  bool isValid() {
    return isNotEmpty(withdrawalId) &&
        proxyAccount != null &&
        proxyAccount.isValid() &&
        amount != null &&
        amount.isValid() &&
        amount.currency == currency &&
        destinationAccount != null &&
        destinationAccount.isValid() &&
        destinationAccount.currency == currency;
  }

  @override
  String get messageType =>
      'in.yagnyam.proxy.messages.banking.Withdrawal';

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$WithdrawalToJson(this);

  static Withdrawal fromJson(Map<String, dynamic> json) =>
      _$WithdrawalFromJson(json);

  static SignedMessage<Withdrawal> signedMessageFromJson(
      Map<String, dynamic> json) {
    SignedMessage<Withdrawal> signed =
        SignedMessage.fromJson<Withdrawal>(json);
    signed.message = MessageBuilder.instance()
        .buildSignableMessage(signed.payload, fromJson);
    return signed;
  }

  @override
  String get requestId => withdrawalId;

  String get currency => proxyAccount.message.currency;
}
