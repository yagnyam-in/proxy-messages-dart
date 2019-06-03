import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

class PaymentUpdatedAlert {
  static const ALERT_TYPE = "in.yagnyam.proxy.messages.payments.alerts.PaymentUpdatedAlert";

  final String alertId;

  final String proxyUniverse;

  final String paymentId;

  final ProxyAccountId payerAccountId;

  PaymentUpdatedAlert({
    @required this.alertId,
    @required this.proxyUniverse,
    @required this.paymentId,
    @required this.payerAccountId,
  });

  factory PaymentUpdatedAlert.fromJson(Map<dynamic, dynamic> map) {
    ProxyAccountId payerAccountId = ProxyAccountId(
        proxyUniverse: map[SignableAlertMessage.PROXY_UNIVERSE], accountId: map['accountId'], bankId: map['bankId']);
    return PaymentUpdatedAlert(
      proxyUniverse: map[SignableAlertMessage.PROXY_UNIVERSE],
      paymentId: map['paymentId'],
      payerAccountId: payerAccountId,
      alertId: map[SignableAlertMessage.ALERT_ID],
    );
  }
}
