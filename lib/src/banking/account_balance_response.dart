import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';
import 'package:proxy_messages/src/banking/account_balance_request.dart';

part 'account_balance_response.g.dart';

@JsonSerializable()
class AccountBalanceResponse extends SignableMessage with ProxyUtils {
  /**
   * Original Request Message
   */
  @JsonKey(nullable: false, fromJson: AccountBalanceRequest.signedMessageFromJson)
  final SignedMessage<AccountBalanceRequest> request;

  /**
   * Latest Balance
   */
  @JsonKey(nullable: false)
  final Amount balance;

  AccountBalanceResponse({
    @required this.request,
    @required this.balance,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isValidProxyObject(request) && balance != null && balance.isValid();
  }

  @override
  void assertValid() {
    assert(request != null);
    request.assertValid();
    assert(balance != null);
    balance.assertValid();
  }

  @override
  ProxyId getSigner() {
    return request.message.proxyAccount.signedBy;
  }

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [request];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.banking.AccountBalanceResponse";

  @override
  String toReadableString() {
    return null;
  }

  String get requestId {
    return request?.message?.requestId;
  }

  ProxyAccountId get proxyAccountId {
    return request?.message?.proxyAccount?.message?.proxyAccountId;
  }

  @override
  String toString() {
    return "AccountBalanceResponse: " +
        {
          "requestId": requestId,
          "proxyAccountId": proxyAccountId.toString(),
          "balance": balance.toString(),
        }.toString();
  }

  @override
  Map<String, dynamic> toJson() => _$AccountBalanceResponseToJson(this);

  static AccountBalanceResponse fromJson(Map json) => _$AccountBalanceResponseFromJson(json);

  static SignedMessage<AccountBalanceResponse> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<AccountBalanceResponse> signed = SignedMessage.fromJson<AccountBalanceResponse>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }
}
