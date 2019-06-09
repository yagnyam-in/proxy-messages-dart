import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/amount.dart';
import 'package:proxy_messages/src/banking/proxy_account.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

part 'deposit_request_creation_request.g.dart';

enum DepositStatusEnum {
  Registered,
  Rejected,
  InProcess,
  Completed,
  Cancelled,
}

@JsonSerializable()
class RequestingCustomer extends ProxyBaseObject with ProxyUtils {
  @JsonKey(nullable: false)
  final String name;

  @JsonKey(nullable: false)
  final String phone;

  @JsonKey(nullable: false)
  final String email;

  RequestingCustomer({@required this.name, @required this.phone, @required this.email});

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

  Map<String, dynamic> toJson() => _$RequestingCustomerToJson(this);

  factory RequestingCustomer.fromJson(Map json) => _$RequestingCustomerFromJson(json);

}

@JsonSerializable()
class DepositRequestCreationRequest extends SignableRequestMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final String depositId;

  @JsonKey(nullable: false, fromJson: ProxyAccount.signedMessageFromJson)
  final SignedMessage<ProxyAccount> proxyAccount;

  @JsonKey(nullable: false)
  final String message;

  @JsonKey(nullable: false)
  final Amount amount;

  @JsonKey(includeIfNull: false)
  final RequestingCustomer requestingCustomer;

  DepositRequestCreationRequest({
    @required this.depositId,
    @required this.proxyAccount,
    @required this.message,
    @required this.amount,
    this.requestingCustomer,
  }) {
    assertValid();
  }

  @override
  void assertValid() {
    assert(isNotEmpty(depositId));
    assert(proxyAccount != null);
    proxyAccount.assertValid();
    assert(isNotEmpty(message));
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
    return isNotEmpty(depositId) &&
        proxyAccount != null &&
        proxyAccount.isValid() &&
        isNotEmpty(message) &&
        amount != null &&
        amount.isValid() &&
        (requestingCustomer == null || requestingCustomer.isValid());
  }

  @override
  String get messageType => 'in.yagnyam.proxy.messages.banking.DepositRequestCreationRequest';

  @override
  String get requestId => depositId;

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$DepositRequestCreationRequestToJson(this);

  static DepositRequestCreationRequest fromJson(Map json) => _$DepositRequestCreationRequestFromJson(json);

  static SignedMessage<DepositRequestCreationRequest> signedMessageFromJson(Map json) {
    SignedMessage<DepositRequestCreationRequest> signed = SignedMessage.fromJson<DepositRequestCreationRequest>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }

  ProxyAccountId get proxyAccountId {
    return proxyAccount.message.proxyAccountId;
  }

  ProxyId get ownerProxyId {
    return proxyAccount.message.ownerProxyId;
  }

  String get proxyUniverse {
    return proxyAccountId.proxyUniverse;
  }

}
