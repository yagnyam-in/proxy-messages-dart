import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';

part 'deposit_link_response.g.dart';

@JsonSerializable()
class DepositLinkResponse extends SignableMessage with ProxyUtils {
  /**
   * Original Request Message
   */
  @JsonKey(nullable: false, fromJson: DepositLinkRequest.signedMessageFromJson)
  final SignedMessage<DepositLinkRequest> request;

  /**
   * Link to use for depositing Money to the account
   */
  @JsonKey(nullable: false)
  final String depositLink;

  DepositLinkResponse({
    @required this.request,
    @required this.depositLink,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isValidProxyObject(request) && isNotEmpty(depositLink);
  }

  @override
  void assertValid() {
    assert(request != null);
    request.assertValid();
    assert(isNotEmpty(depositLink));
  }

  @override
  ProxyId getSigner() {
    return request.message.proxyAccount.signedBy;
  }

  @override
  List<SignedMessage<SignableMessage>> getChildMessages() {
    return [request];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.banking.DepositLinkResponse";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$DepositLinkResponseToJson(this);
  static DepositLinkResponse fromJson(Map<String, dynamic> json) => _$DepositLinkResponseFromJson(json);

  static SignedMessage<DepositLinkResponse> signedMessageFromJson(Map<String, dynamic> json) {
    SignedMessage<DepositLinkResponse> signed = SignedMessage.fromJson<DepositLinkResponse>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }

}
