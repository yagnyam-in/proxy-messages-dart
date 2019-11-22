import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';

import 'authorize_bunq_account_request.dart';

part 'authorize_bunq_account_response.g.dart';

@JsonSerializable()
class AuthorizeBunqAccountResponse extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false, fromJson: AuthorizeBunqAccountRequest.signedMessageFromJson)
  final SignedMessage<AuthorizeBunqAccountRequest> request;

  @JsonKey(nullable: false, fromJson: ProxyAccount.signedMessagesFromJson)
  final List<SignedMessage<ProxyAccount>> proxyAccounts;

  AuthorizeBunqAccountResponse({
    @required this.request,
    @required this.proxyAccounts,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isValidProxyObject(request) &&
        isNonEmptyProxyObjectList(proxyAccounts);
  }

  @override
  void assertValid() {
    assertValidProxyObject(request);
    assertNonEmptyProxyObjectList(proxyAccounts);
  }

  @override
  ProxyId getSigner() {
    return request.message.bankProxyId;
  }

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [request, ...proxyAccounts];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.banking.bunq.AuthorizeBunqAccountResponse";

  @override
  String toReadableString() {
    return null;
  }

  static AuthorizeBunqAccountResponse fromJson(Map json) => _$AuthorizeBunqAccountResponseFromJson(json);

  static SignedMessage<AuthorizeBunqAccountResponse> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<AuthorizeBunqAccountResponse> signed = SignedMessage.fromJson<AuthorizeBunqAccountResponse>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }

  Map<String, dynamic> toJson() => _$AuthorizeBunqAccountResponseToJson(this);
}
