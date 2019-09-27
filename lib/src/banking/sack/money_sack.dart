import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/banking.dart';

import 'money_sack_id.dart';

part 'money_sack.g.dart';

@JsonSerializable()
class MoneySack extends SignableMessage with ProxyUtils {
  @JsonKey(nullable: false)
  final MoneySackId moneySackId;

  @JsonKey(nullable: false)
  final ProxyId ownerProxyId;

  @JsonKey(nullable: false)
  final DateTime creationDate;

  @JsonKey(nullable: false)
  final DateTime expiryDate;

  @JsonKey(nullable: false)
  final Amount balance;

  MoneySack({
    @required this.moneySackId,
    @required this.ownerProxyId,
    @required this.creationDate,
    @required this.expiryDate,
    @required this.balance,
  }) {
    assertValid();
  }

  @override
  ProxyId getSigner() {
    return moneySackId.sackProviderProxyId;
  }

  @override
  String toReadableString() {
    return null;
  }

  @override
  bool isValid() {
    return isValidProxyObject(moneySackId) &&
        isValidProxyId(ownerProxyId) &&
        isValidDateTime(creationDate) &&
        isValidDateTime(expiryDate) &&
        isValidProxyObject(balance);
  }

  @override
  void assertValid() {
    assertValidProxyObject(moneySackId);
    assertValidProxyId(ownerProxyId);
    assertValidDateTime(creationDate);
    assertValidDateTime(expiryDate);
    assertValidProxyObject(balance);
  }

  static MoneySack fromJson(Map json) => _$MoneySackFromJson(json);

  static SignedMessage<MoneySack> signedMessageFromJson(Map json) {
    if (json == null) return null;
    SignedMessage<MoneySack> signedMessage = SignedMessage.fromJson<MoneySack>(json);
    signedMessage.message = MessageBuilder.instance().buildSignableMessage(signedMessage.payload, fromJson);
    return signedMessage;
  }

  @override
  Map<String, dynamic> toJson() => _$MoneySackToJson(this);

  @override
  List<SignedMessage<SignableMessage>> getSignedChildMessages() {
    return [];
  }

  @override
  List<MultiSignedMessage<MultiSignableMessage>> getMultiSignedChildMessages() {
    return [];
  }

  @override
  String get messageType => "in.yagnyam.proxy.messages.sack.MoneySack";

  ProxyId get sackProviderProxyId => moneySackId.sackProviderProxyId;

  String get proxyUniverse => moneySackId.proxyUniverse;
}
