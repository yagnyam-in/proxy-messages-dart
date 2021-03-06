import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/deposit/deposit_request.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

part 'deposit_request_status_request.g.dart';

@JsonSerializable()
class DepositRequestStatusRequest extends SignableRequestMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final String requestId;

  /**
   * Original Request Message
   */
  @JsonKey(nullable: false, fromJson: DepositRequest.signedMessageFromJson)
  final SignedMessage<DepositRequest> depositRequest;

  DepositRequestStatusRequest({
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
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [depositRequest];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.banking.DepositRequestStatusRequest";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$DepositRequestStatusRequestToJson(this);

  static DepositRequestStatusRequest fromJson(Map json) => _$DepositRequestStatusRequestFromJson(json);

  static SignedMessage<DepositRequestStatusRequest> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<DepositRequestStatusRequest> signed = SignedMessage.fromJson<DepositRequestStatusRequest>(json);
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
