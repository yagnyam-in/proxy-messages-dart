import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';

part 'escrow_account_proposal.g.dart';

@JsonSerializable()
class EscrowAccountProposal extends SignableMessage with ProxyUtils {
  /**
   * Unique Request Id. No two requests shall have same request number
   */
  @JsonKey(nullable: false)
  final String proposalId;

  @JsonKey(nullable: false)
  final String proxyUniverse;

  /**
   * Payer (Buyer) Proxy Id
   */
  @JsonKey(nullable: false)
  final ProxyId payerProxyId;

  @JsonKey(nullable: false)
  final ProxyId bankProxyId;

  @JsonKey(nullable: false)
  final Amount amount;

  @JsonKey(nullable: false)
  final String title;

  @JsonKey(nullable: true)
  final String description;

  EscrowAccountProposal({
    @required this.proposalId,
    @required this.proxyUniverse,
    @required this.payerProxyId,
    @required this.bankProxyId,
    @required this.amount,
    @required this.title,
    @required this.description,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isNotEmpty(proposalId) &&
        isNotEmpty(proxyUniverse) &&
        isValidProxyId(payerProxyId) &&
        isValidProxyId(bankProxyId) &&
        isValidProxyObject(amount) &&
        isNotEmpty(title);
  }

  @override
  void assertValid() {
    assertNotEmpty(proposalId);
    assertNotEmpty(proxyUniverse);
    assertValidProxyId(payerProxyId);
    assertValidProxyId(bankProxyId);
    assertValidProxyObject(amount);
    assertNotEmpty(title);
  }

  @override
  ProxyId getSigner() {
    return payerProxyId;
  }

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.escrow.EscrowAccountProposal";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$EscrowAccountProposalToJson(this);

  static EscrowAccountProposal fromJson(Map json) => _$EscrowAccountProposalFromJson(json);

  static SignedMessage<EscrowAccountProposal> signedMessageFromJson(Map json) {
    SignedMessage<EscrowAccountProposal> signedMessage = SignedMessage.fromJson<EscrowAccountProposal>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }
}
