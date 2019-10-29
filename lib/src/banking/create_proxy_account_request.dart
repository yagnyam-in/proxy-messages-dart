import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/proxy_account.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

part 'create_proxy_account_request.g.dart';

@JsonSerializable()
class CreateProxyAccountRequest extends SignableRequestMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final String requestId;

  @JsonKey(nullable: false, fromJson: ProxyAccount.signedMessageFromJson)
  final SignedMessage<ProxyAccount> proxyAccount;

  @JsonKey(nullable: false)
  final ProxyId newOwnerProxyId;

  @JsonKey(nullable: false)
  final List<ProxyAccountPermissionEnum> permissions;

  CreateProxyAccountRequest({
    @required this.requestId,
    @required this.proxyAccount,
    @required this.newOwnerProxyId,
    @required this.permissions,
  }) {
    assertValid();
  }

  @override
  void assertValid() {
    assertNotEmpty(requestId);
    assertValidProxyObject(proxyAccount);
    assertValidProxyId(newOwnerProxyId);
    assertNonEmptyList(permissions);
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
    return isNotEmpty(requestId) && isValidProxyObject(proxyAccount) && isValidProxyId(newOwnerProxyId) && isNonEmptyList(permissions);
  }

  @override
  String get messageType => 'in.yagnyam.proxy.messages.banking.CreateProxyAccountRequest';

  @override
  String toReadableString() {
    return null;
  }

  ProxyAccountId get proxyAccountId {
    return proxyAccount?.message?.proxyAccountId;
  }

  @override
  String toString() {
    return "CreateProxyAccountRequest: " +
        {
          "requestId": requestId,
          "proxyAccountId": proxyAccountId.toString(),
        }.toString();
  }

  @override
  Map<String, dynamic> toJson() => _$CreateProxyAccountRequestToJson(this);

  static CreateProxyAccountRequest fromJson(Map json) => _$CreateProxyAccountRequestFromJson(json);

  static SignedMessage<CreateProxyAccountRequest> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<CreateProxyAccountRequest> signed = SignedMessage.fromJson<CreateProxyAccountRequest>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }
}
