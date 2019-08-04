import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/escrow/escrow_account.dart';
import 'package:proxy_messages/src/banking/escrow/escrow_account_creation_request.dart';

part 'escrow_account_creation_response.g.dart';

@JsonSerializable()
class EscrowAccountCreationResponse extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false, fromJson: EscrowAccountCreationRequest.signedMessageFromJson)
  final SignedMessage<EscrowAccountCreationRequest> request;

  @JsonKey(nullable: false, fromJson: EscrowAccount.signedMessageFromJson)
  final SignedMessage<EscrowAccount> escrowAccount;

  EscrowAccountCreationResponse({
    @required this.request,
    @required this.escrowAccount,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    EscrowAccountCreationRequest r = request.message;
    EscrowAccount a = escrowAccount.message;
    return isValidProxyObject(request) &&
        isValidProxyObject(escrowAccount) &&
        r.amount == a.balance &&
        r.escrowProxyId == a.escrowProxyId &&
        r.payerProxyId == a.payerProxyId &&
        r.payeeProxyId == a.payeeProxyId &&
        r.bankProxyId == a.bankProxyId;
  }

  @override
  void assertValid() {
    assertValidProxyObject(request);
    assertValidProxyObject(escrowAccount);
  }

  @override
  ProxyId getSigner() {
    return escrowAccount.message.bankProxyId;
  }

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [escrowAccount, request];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.escrow.EscrowAccountCreationResponse";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$EscrowAccountCreationResponseToJson(this);

  static EscrowAccountCreationResponse fromJson(Map json) => _$EscrowAccountCreationResponseFromJson(json);

  static SignedMessage<EscrowAccountCreationResponse> signedMessageFromJson(Map json) {
    SignedMessage<EscrowAccountCreationResponse> signedMessage =
        SignedMessage.fromJson<EscrowAccountCreationResponse>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }
}
