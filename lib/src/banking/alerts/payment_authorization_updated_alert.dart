import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

class PaymentAuthorizationUpdatedAlert extends Alert {
  static const ALERT_TYPE = "in.yagnyam.proxy.messages.payments.alerts.PaymentAuthorizationUpdatedAlert";

  final String paymentAuthorizationId;

  final ProxyAccountId payerAccountId;

  PaymentAuthorizationUpdatedAlert({
    @required String alertId,
    @required String proxyUniverse,
    @required this.paymentAuthorizationId,
    @required this.payerAccountId,
  }) : super(
          alertId: alertId,
          alertType: ALERT_TYPE,
          proxyUniverse: proxyUniverse,
        );

  factory PaymentAuthorizationUpdatedAlert.fromJson(Map<dynamic, dynamic> map) {
    ProxyAccountId payerAccountId = ProxyAccountId(
      proxyUniverse: map[SignableAlertMessage.PROXY_UNIVERSE],
      accountId: map['accountId'],
      bankProxyId: ProxyId.fromUniqueId(map['bankProxyId']),
    );
    return PaymentAuthorizationUpdatedAlert(
      proxyUniverse: map[SignableAlertMessage.PROXY_UNIVERSE],
      paymentAuthorizationId: map['paymentAuthorizationId'],
      payerAccountId: payerAccountId,
      alertId: map[SignableAlertMessage.ALERT_ID],
    );
  }
}
