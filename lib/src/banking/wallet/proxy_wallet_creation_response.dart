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
  @JsonKey(nullable: false, fromJson: ProxyWalletCreationRequest.signedMessageFromJson)
  final SignedMessage<ProxyWalletCreationRequest> request;

  /**
   * Proxy Account
   */
  @JsonKey(nullable: false, fromJson: ProxyAccount.signedMessageFromJson)
  final SignedMessage<ProxyAccount> proxyAccount;

  ProxyWalletCreationResponse({
    @required this.request,
    @required this.proxyAccount,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isValidProxyObject(request) &&
        isValidProxyObject(proxyAccount) &&
        proxyAccount.signedBy.canSignOnBehalfOf(request.message.bankId);
  }

  @override
  void assertValid() {
    request.assertValid();
    proxyAccount.assertValid();
    assert(proxyAccount.signedBy.canSignOnBehalfOf(request.message.bankId));
  }

  @override
  ProxyId getSigner() {
    return request.message.bankId;
  }

  @override
  List<SignedMessage<SignableMessage>> getChildMessages() {
    return [request, proxyAccount];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.banking.wallet.ProxyWalletCreationResponse";

  @override
  String toReadableString() {
    return null;
  }

  static ProxyWalletCreationResponse fromJson(Map<String, dynamic> json) => _$ProxyWalletCreationResponseFromJson(json);

  static SignedMessage<ProxyWalletCreationResponse> signedMessageFromJson(Map<String, dynamic> json) {
    SignedMessage<ProxyWalletCreationResponse> signed = SignedMessage.fromJson<ProxyWalletCreationResponse>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }

  Map<String, dynamic> toJson() => _$ProxyWalletCreationResponseToJson(this);
}
