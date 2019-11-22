import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';

part 'authorize_bunq_account_request.g.dart';

@JsonSerializable()
class AuthorizeBunqAccountRequest extends SignableRequestMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final String requestId;

  @JsonKey(nullable: false)
  final ProxyId ownerProxyId;

  @JsonKey(nullable: false)
  final ProxyId bankProxyId;

  @JsonKey(nullable: false)
  final String currency;

  @JsonKey(nullable: false)
  final String apiToken;

  @JsonKey(nullable: true)
  final String accountNumber;

  AuthorizeBunqAccountRequest({
    @required this.requestId,
    @required this.ownerProxyId,
    @required this.bankProxyId,
    @required this.currency,
    @required this.apiToken,
    this.accountNumber,
  }) {
    assertValid();
  }

  @override
  bool isValid() {
    return isNotEmpty(requestId) &&
        isValidProxyId(ownerProxyId) &&
        isValidProxyId(bankProxyId) &&
        Currency.isValidCurrency(currency) &&
        isNotEmpty(apiToken);
  }

  @override
  void assertValid() {
    assertNotEmpty(requestId);
    assertValidProxyId(ownerProxyId);
    assertValidProxyId(bankProxyId);
    assert(Currency.isValidCurrency(currency));
    assertNotEmpty(apiToken);
  }

  @override
  ProxyId getSigner() {
    return ownerProxyId;
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
  String get messageType => "in.yagnyam.proxy.messages.banking.bunq.AuthorizeBunqAccountRequest";

  @override
  String toReadableString() {
    return null;
  }

  @override
  Map<String, dynamic> toJson() => _$AuthorizeBunqAccountRequestToJson(this);

  static AuthorizeBunqAccountRequest fromJson(Map json) => _$AuthorizeBunqAccountRequestFromJson(json);

  static SignedMessage<AuthorizeBunqAccountRequest> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<AuthorizeBunqAccountRequest> signedMessage =
        SignedMessage.fromJson<AuthorizeBunqAccountRequest>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }
}
