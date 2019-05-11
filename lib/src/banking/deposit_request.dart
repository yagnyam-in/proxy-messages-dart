import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';

part 'deposit_request.g.dart';

@JsonSerializable()
class DepositRequest extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final String depositId;

  @JsonKey(nullable: false, fromJson: ProxyAccount.signedMessageFromJson)
  final SignedMessage<ProxyAccount> proxyAccount;

  @JsonKey(nullable: false)
  final Amount amount;

  @JsonKey(nullable: false)
  final DateTime creationDate;

  @JsonKey(nullable: false)
  final DateTime expiryDate;

  @JsonKey(nullable: false)
  final String depositLink;

  DepositRequest({
    @required this.depositId,
    @required this.proxyAccount,
    @required this.amount,
    @required this.creationDate,
    @required this.expiryDate,
    @required this.depositLink,
  }) {
    assertValid();
  }

  @override
  void assertValid() {
    assert(isNotEmpty(depositId));
    assert(proxyAccount != null);
    proxyAccount.assertValid();
    assert(amount != null);
    amount.assertValid();
    assert(isValidDateTime(creationDate));
    assert(isValidDateTime(expiryDate));
    assert(creationDate.isBefore(expiryDate));
    assert(isNotEmpty(depositLink));
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
        amount != null &&
        amount.isValid() &&
        isValidDateTime(creationDate) &&
        isValidDateTime(expiryDate) &&
        creationDate.isBefore(expiryDate) &&
        isNotEmpty(depositLink);
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.banking.DepositRequest";


  @override
  ProxyId getSigner() {
    return proxyAccount.signedBy;
  }

  @override
  String toReadableString() {
    return null;
  }

  static DepositRequest fromJson(Map<String, dynamic> json) => _$DepositRequestFromJson(json);

  static SignedMessage<DepositRequest> signedMessageFromJson(Map<String, dynamic> json) {
    SignedMessage<DepositRequest> signedMessage = SignedMessage.fromJson<DepositRequest>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$DepositRequestToJson(this);

  ProxyId get ownerProxyId {
    return proxyAccount.message.ownerProxyId;
  }

  ProxyAccountId get proxyAccountId {
    return proxyAccount.message.proxyAccountId;
  }

  String get proxyUniverse {
    return proxyAccountId.proxyUniverse;
  }

}
