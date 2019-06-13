import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

class PaymentAuthorizationUpdatedAlert {
  static const ALERT_TYPE =
      "in.yagnyam.proxy.messages.payments.alerts.PaymentAuthorizationUpdatedAlert";

  final String alertId;

  final String proxyUniverse;

  final String paymentAuthorizationId;

  final ProxyAccountId payerAccountId;

  PaymentAuthorizationUpdatedAlert({
    @required this.alertId,
    @required this.proxyUniverse,
    @required this.paymentAuthorizationId,
    @required this.payerAccountId,
  });

  factory PaymentAuthorizationUpdatedAlert.fromJson(Map<dynamic, dynamic> map) {
    ProxyAccountId payerAccountId = ProxyAccountId(
        proxyUniverse: map[SignableAlertMessage.PROXY_UNIVERSE],
        accountId: map['accountId'],
        bankId: map['bankId']);
    return PaymentAuthorizationUpdatedAlert(
      proxyUniverse: map[SignableAlertMessage.PROXY_UNIVERSE],
      paymentAuthorizationId: map['paymentAuthorizationId'],
      payerAccountId: payerAccountId,
      alertId: map[SignableAlertMessage.ALERT_ID],
    );
  }
}
