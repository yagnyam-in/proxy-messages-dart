import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/proxy_account.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

part 'account_balance_request.g.dart';

@JsonSerializable()
class AccountBalanceRequest extends SignableRequestMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final String requestId;

  @JsonKey(nullable: false, fromJson: ProxyAccount.signedMessageFromJson)
  final SignedMessage<ProxyAccount> proxyAccount;

  AccountBalanceRequest({
    @required this.requestId,
    @required this.proxyAccount,
  }) {
    assertValid();
  }

  @override
  void assertValid() {
    assert(isNotEmpty(requestId));
    assert(proxyAccount != null);
    proxyAccount.assertValid();
  }

  @override
  ProxyId getSigner() {
    return proxyAccount.message.ownerProxyId;
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
    return isNotEmpty(requestId) && proxyAccount != null && proxyAccount.isValid();
  }

  @override
  String get messageType => 'in.yagnyam.proxy.messages.banking.AccountBalanceRequest';

  @override
  String toReadableString() {
    return null;
  }

  ProxyAccountId get proxyAccountId {
    return proxyAccount?.message?.proxyAccountId;
  }

  @override
  String toString() {
    return "AccountBalanceRequest: " +
        {
          "requestId": requestId,
          "proxyAccountId": proxyAccountId.toString(),
        }.toString();
  }

  @override
  Map<String, dynamic> toJson() => _$AccountBalanceRequestToJson(this);

  static AccountBalanceRequest fromJson(Map json) => _$AccountBalanceRequestFromJson(json);

  static SignedMessage<AccountBalanceRequest> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<AccountBalanceRequest> signed = SignedMessage.fromJson<AccountBalanceRequest>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }
}
