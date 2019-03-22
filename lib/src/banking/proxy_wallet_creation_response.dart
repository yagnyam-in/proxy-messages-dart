import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';

part 'proxy_wallet_creation_response.g.dart';

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
        assert(isValidProxyObject(proxyAccount)),
        assert(proxyAccount.signedBy.canSignOnBehalfOf(request.message.bankId));

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
  String get messageType => "in.yagnyam.proxy.messages.banking.ProxyWalletCreationResponse";

  @override
  String toReadableString() {
    return null;
  }

  factory ProxyWalletCreationResponse.fromJson(Map<String, dynamic> json) =>
      _$ProxyWalletCreationResponseFromJson(json);

  static ProxyWalletCreationResponse staticFromJson(Map<String, dynamic> json) =>
      ProxyWalletCreationResponse.fromJson(json);

  Map<String, dynamic> toJson() => _$ProxyWalletCreationResponseToJson(this);
}
