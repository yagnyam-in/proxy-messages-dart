import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

class PaymentEncashmentUpdatedAlert {
  static const ALERT_TYPE =
      "in.yagnyam.proxy.messages.payments.alerts.PaymentEncashmentUpdatedAlert";

  final String alertId;

  final String proxyUniverse;

  final String paymentAuthorizationId;

  final String paymentEncashmentId;

  final ProxyAccountId payerAccountId;

  PaymentEncashmentUpdatedAlert({
    @required this.alertId,
    @required this.proxyUniverse,
    @required this.paymentAuthorizationId,
    @required this.paymentEncashmentId,
    @required this.payerAccountId,
  });

  factory PaymentEncashmentUpdatedAlert.fromJson(Map<dynamic, dynamic> map) {
    ProxyAccountId payerAccountId = ProxyAccountId(
        proxyUniverse: map[SignableAlertMessage.PROXY_UNIVERSE],
        accountId: map['accountId'],
        bankId: map['bankId']);
    return PaymentEncashmentUpdatedAlert(
      proxyUniverse: map[SignableAlertMessage.PROXY_UNIVERSE],
      paymentAuthorizationId: map['paymentAuthorizationId'],
      paymentEncashmentId: map['paymentEncashmentId'],
      payerAccountId: payerAccountId,
      alertId: map[SignableAlertMessage.ALERT_ID],
    );
  }
}
