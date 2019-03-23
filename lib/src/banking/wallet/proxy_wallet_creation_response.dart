import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';

@JsonSerializable()
class ProxyWalletCreationResponse extends SignableMessage with ProxyUtils {
  /**
   * Original Request Message
   */
  @JsonKey(nullable: false)
  final SignedMessage<ProxyWalletCreationRequest> request;

  /**
   * Proxy Account
   */
  @JsonKey(nullable: false)
  final SignedMessage<ProxyAccount> proxyAccount;

  ProxyWalletCreationResponse({
    @required this.request,
    @required this.proxyAccount,
  })  : assert(isValidProxyObject(request)),
        assert(isValidProxyObject(proxyAccount));

  @override
  bool isValid() {
    return isValidProxyObject(request) &&
        isValidProxyObject(proxyAccount) &&
        proxyAccount.signedBy.canSignOnBehalfOf(request.message.bankId);
  }

  @override
  ProxyId getSigner() {
    return request.message.bankId;
  }

  @override
  List<SignedMessage<SignableMessage>> getChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.banking.wallet.ProxyWalletCreationResponse";

  @override
  String toReadableString() {
    return null;
  }

  static ProxyWalletCreationResponse build(Map<String, dynamic> json, MessageBuilder messageBuilder) =>
      ProxyWalletCreationResponse(
        request: messageBuilder.buildSignedMessage(json['request'], ProxyWalletCreationRequest.build),
        proxyAccount: messageBuilder.buildSignedMessage(json['proxyAccount'], ProxyAccount.build),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{'request': request, 'proxyAccount': proxyAccount};
}
