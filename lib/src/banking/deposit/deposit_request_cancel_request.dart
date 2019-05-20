
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/deposit/deposit_request.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

part 'deposit_request_cancel_request.g.dart';

@JsonSerializable()
class DepositRequestCancelRequest extends SignableRequestMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final String requestId;

  /**
   * Original Request Message
   */
  @JsonKey(nullable: false, fromJson: DepositRequest.signedMessageFromJson)
  final SignedMessage<DepositRequest> depositRequest;

  DepositRequestCancelRequest({
    @required this.requestId,
    @required this.depositRequest,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isNotEmpty(requestId) && isValidProxyObject(depositRequest);
  }

  @override
  void assertValid() {
    assert(isNotEmpty(requestId));
    assert(depositRequest != null);
    depositRequest.assertValid();
  }

  @override
  ProxyId getSigner() {
    return ownerProxyId;
  }

  @override
  List<SignedMessage<SignableMessage>> getChildMessages() {
    return [depositRequest];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.banking.DepositRequestCancelRequest";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$DepositRequestCancelRequestToJson(this);

  static DepositRequestCancelRequest fromJson(Map<String, dynamic> json) => _$DepositRequestCancelRequestFromJson(json);

  static SignedMessage<DepositRequestCancelRequest> signedMessageFromJson(Map<String, dynamic> json) {
    SignedMessage<DepositRequestCancelRequest> signed = SignedMessage.fromJson<DepositRequestCancelRequest>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }


  String get depositId {
    return depositRequest.message.depositId;
  }

  ProxyAccountId get proxyAccountId {
    return depositRequest.message.proxyAccountId;
  }

  ProxyId get ownerProxyId {
    return depositRequest.message.ownerProxyId;
  }


  String get proxyUniverse {
    return proxyAccountId.proxyUniverse;
  }
}
