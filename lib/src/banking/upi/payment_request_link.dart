import 'dart:collection';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';

part 'payment_request_link.g.dart';

@JsonSerializable()
class PaymentRequestLink with ProxyUtils {
  static const SIGNATURE_QUERY_PARAM = "sign";

  @JsonKey(name: 'pa', nullable: false)
  final String payeeVpa;

  @JsonKey(name: 'pn', nullable: false)
  final String payeeName;

  @JsonKey(name: 'mc', nullable: true)
  final String payeeMerchantCode;

  @JsonKey(name: 'tid', nullable: true)
  final String paymentTransactionId;

  @JsonKey(name: 'tr', nullable: true)
  final String underlyingTransactionId;

  @JsonKey(name: 'tn', nullable: true)
  final String transactionNote;

  @JsonKey(name: 'am', nullable: true)
  final String amount;

  @JsonKey(name: 'mam', nullable: true)
  final String minimumAmount;

  @JsonKey(name: 'cu', nullable: true)
  final String currency;

  @JsonKey(name: 'url', nullable: true)
  final String underlyingTransactionUrl;

  @JsonKey(name: 'mode', nullable: false)
  final String initiationMode;

  @JsonKey(name: SIGNATURE_QUERY_PARAM, nullable: true)
  final String signature;

  @JsonKey(name: 'orgid', nullable: false)
  final String organisationID;

  @JsonKey(name: 'mid', nullable: true)
  final String merchantId;

  @JsonKey(name: 'msid', nullable: true)
  final String storeId;

  @JsonKey(name: 'mtid', nullable: true)
  final String terminalId;

  @JsonKey(ignore: true)
  String get urlWithoutSignature {
    final json = SplayTreeMap.of(_$PaymentRequestLinkToJson(this));
    json.removeWhere((key, value) => key == SIGNATURE_QUERY_PARAM);
    return Uri(
      scheme: 'upi',
      path: 'pay',
      queryParameters: json,
    ).toString();
  }

  String get urlWithSignature {
    if (isNotEmpty(signature)) {
      return "$urlWithoutSignature&$SIGNATURE_QUERY_PARAM=$signature";
    } else {
      return urlWithoutSignature;
    }
  }

  PaymentRequestLink({
    @required this.payeeVpa,
    @required this.payeeName,
    this.payeeMerchantCode,
    this.paymentTransactionId,
    this.underlyingTransactionId,
    this.transactionNote,
    this.minimumAmount,
    this.currency,
    this.underlyingTransactionUrl,
    @required this.initiationMode,
    this.signature,
    @required this.organisationID,
    this.merchantId,
    this.storeId,
    this.terminalId,
    this.amount,
  }) {
    assertValid();
  }

  void assertValid() {
    assertNotEmpty(payeeVpa);
    assertNotEmpty(payeeName);
    assertNotEmpty(initiationMode);
    assertNotEmpty(organisationID);
    if (isNotEmpty(underlyingTransactionUrl)) {
      assert(underlyingTransactionUrl.startsWith(RegExp('https?:\\/\\/')));
    }
    // assert(isNotEmpty(amount) || isNotEmpty(minimumAmount));
  }

  Map<String, dynamic> toJson() => _$PaymentRequestLinkToJson(this);

  static PaymentRequestLink fromJson(Map json) => _$PaymentRequestLinkFromJson(json);
}
