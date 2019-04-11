import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';

part 'deposit_response.g.dart';

@JsonSerializable()
class DepositResponse extends SignableMessage with ProxyUtils {
  /**
   * Original Request Message
   */
  @JsonKey(nullable: false, fromJson: DepositRequest.signedMessageFromJson)
  final SignedMessage<DepositRequest> request;

  /**
   * Link to use for depositing Money to the account
   */
  @JsonKey(nullable: false)
  final String depositLink;

  /**
   * Status of the Deposit
   */
  @JsonKey(nullable: false)
  final DepositStatusEnum status;

  DepositResponse({
    @required this.request,
    @required this.depositLink,
    @required this.status,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isValidProxyObject(request) && isNotEmpty(depositLink) && status != null;
  }

  @override
  void assertValid() {
    assert(request != null);
    request.assertValid();
    assert(isNotEmpty(depositLink));
    assert(status != null);
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
  String get messageType => "in.yagnyam.proxy.messages.banking.DepositResponse";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$DepositResponseToJson(this);
  static DepositResponse fromJson(Map<String, dynamic> json) => _$DepositResponseFromJson(json);

  static SignedMessage<DepositResponse> signedMessageFromJson(Map<String, dynamic> json) {
    SignedMessage<DepositResponse> signed = SignedMessage.fromJson<DepositResponse>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }

}
