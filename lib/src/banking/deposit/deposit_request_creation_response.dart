import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';

part 'deposit_request_creation_response.g.dart';

@JsonSerializable()
class DepositRequestCreationResponse extends SignableMessage with ProxyUtils {
  /**
   * Original Request Message
   */
  @JsonKey(nullable: false, fromJson: DepositRequestCreationRequest.signedMessageFromJson)
  final SignedMessage<DepositRequestCreationRequest> request;

  /**
   * Deposit Request Signed by Server
   */
  @JsonKey(nullable: false, fromJson: DepositRequest.signedMessageFromJson)
  final SignedMessage<DepositRequest> depositRequest;

  /**
   * Status of the Deposit
   */
  @JsonKey(nullable: false)
  final DepositStatusEnum status;

  DepositRequestCreationResponse({
    @required this.request,
    @required this.depositRequest,
    @required this.status,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isValidProxyObject(request)
        && isValidProxyObject(depositRequest)
        && status != null;
  }

  @override
  void assertValid() {
    assert(request != null);
    request.assertValid();
    assert(depositRequest != null);
    depositRequest.assertValid();
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
  String get messageType => "in.yagnyam.proxy.messages.banking.DepositRequestCreationResponse";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$DepositRequestCreationResponseToJson(this);
  static DepositRequestCreationResponse fromJson(Map json) => _$DepositRequestCreationResponseFromJson(json);

  static SignedMessage<DepositRequestCreationResponse> signedMessageFromJson(Map json) {
    SignedMessage<DepositRequestCreationResponse> signed = SignedMessage.fromJson<DepositRequestCreationResponse>(json);
    signed.message = MessageBuilder.instance().buildSignableMessage(signed.payload, fromJson);
    return signed;
  }


  String get depositLink {
    return depositRequest.message.depositLink;
  }

}
