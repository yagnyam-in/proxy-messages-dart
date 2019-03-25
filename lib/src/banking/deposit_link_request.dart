import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/amount.dart';
import 'package:proxy_messages/src/banking/proxy_account.dart';

part 'deposit_link_request.g.dart';

@JsonSerializable()
class _RequestingCustomer extends ProxyBaseObject with ProxyUtils {
  @JsonKey(nullable: false)
  final String name;

  @JsonKey(nullable: false)
  final String phone;

  @JsonKey(nullable: false)
  final String email;

  _RequestingCustomer({@required this.name, @required this.phone, @required this.email});

  @override
  void assertValid() {
    assert(isNotEmpty(name));
    assert(isNotEmpty(phone));
    assert(isNotEmpty(email));
  }

  @override
  bool isValid() {
    return isNotEmpty(name) && isNotEmpty(phone) && isNotEmpty(email);
  }

  Map<String, dynamic> toJson() => _$_RequestingCustomerToJson(this);

  factory _RequestingCustomer.fromJson(Map<String, dynamic> json) => _$_RequestingCustomerFromJson(json);

}

@JsonSerializable()
class DepositLinkRequest extends SignableRequestMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final String requestId;

  @JsonKey(nullable: false, fromJson: ProxyAccount.signedMessageFromJson)
  final SignedMessage<ProxyAccount> proxyAccount;

  @JsonKey(nullable: false)
  final String accountName;

  @JsonKey(nullable: false)
  final Amount amount;

  final String message;

  final _RequestingCustomer requestingCustomer;

  DepositLinkRequest({
    @required this.requestId,
    @required this.proxyAccount,
    @required this.accountName,
    @required this.amount,
    this.message,
    this.requestingCustomer,
  }) {
    assertValid();
  }

  @override
  void assertValid() {
    assert(isNotEmpty(requestId));
    assert(proxyAccount != null);
    proxyAccount.assertValid();
    assert(isNotEmpty(accountName));
    assert(amount != null);
    amount.assertValid();
    if (requestingCustomer != null) {
      requestingCustomer.assertValid();
    }
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
    return isNotEmpty(requestId) &&
        proxyAccount != null &&
        proxyAccount.isValid() &&
        isNotEmpty(accountName) &&
        amount != null &&
        amount.isValid() &&
        (requestingCustomer == null || requestingCustomer.isValid());
  }

  @override
  String get messageType => 'in.yagnyam.proxy.messages.banking.DepositLinkRequest';

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$DepositLinkRequestToJson(this);

  static DepositLinkRequest fromJson(Map<String, dynamic> json) => _$DepositLinkRequestFromJson(json);

  static SignedMessage<DepositLinkRequest> signedMessageFromJson(Map<String, dynamic> json) {
    SignedMessage<DepositLinkRequest> signed = SignedMessage.fromJson<DepositLinkRequest>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }
}
