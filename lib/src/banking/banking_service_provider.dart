import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

part 'banking_service_provider.g.dart';

@JsonSerializable()
class BankingServiceProvider extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final ProxyId proxyId;

  @JsonKey(nullable: false)
  final String proxyUniverse;

  @JsonKey(nullable: false)
  final List<String> supportedCurrencies;

  @JsonKey(nullable: false)
  final String apiEndpoint;
  @JsonKey(nullable: false)
  final String name;

  BankingServiceProvider({
    @required this.proxyId,
    @required this.proxyUniverse,
    @required this.supportedCurrencies,
    @required this.apiEndpoint,
    @required this.name,
  }) {
    assertValid();
  }

  @override
  ProxyId getSigner() {
    return ProxyId("proxy-banking");
  }

  @override
  String toReadableString() {
    return null;
  }

  @override
  bool isValid() {
    return isValidProxyId(proxyId) &&
        isNotEmpty(proxyUniverse) &&
        isNonEmptyList(supportedCurrencies) &&
        isNotEmpty(apiEndpoint) &&
        isNotEmpty(name);
  }

  @override
  void assertValid() {
    assertValidProxyId(proxyId);
    assertNotEmpty(proxyUniverse);
    assertNonEmptyList(supportedCurrencies);
    assertNotEmpty(apiEndpoint);
    assertNotEmpty(name);
  }

  static BankingServiceProvider fromJson(Map json) => _$BankingServiceProviderFromJson(json);

  static SignedMessage<BankingServiceProvider> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<BankingServiceProvider> signedMessage = SignedMessage.fromJson<BankingServiceProvider>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$BankingServiceProviderToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.banking.BankingServiceProvider";

  String get id => proxyId.id;
}
