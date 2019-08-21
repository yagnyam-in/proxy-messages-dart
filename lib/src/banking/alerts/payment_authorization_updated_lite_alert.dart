import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

import 'payment_authorization_updated_alert.dart';

class PaymentAuthorizationUpdatedLiteAlert extends LiteAlert {

  final String paymentAuthorizationId;

  final ProxyAccountId payerAccountId;

  PaymentAuthorizationUpdatedLiteAlert({
    @required String alertId,
    @required String proxyUniverse,
    @required ProxyId receiverProxyId,
    @required this.paymentAuthorizationId,
    @required this.payerAccountId,
  }) : super(
    alertId: alertId,
    alertType: PaymentAuthorizationUpdatedAlert.ALERT_TYPE,
    proxyUniverse: proxyUniverse,
    receiverProxyId: receiverProxyId,
  );

  factory PaymentAuthorizationUpdatedLiteAlert.fromJson(Map<dynamic, dynamic> map) {
    return PaymentAuthorizationUpdatedLiteAlert(
      proxyUniverse: map[SignableAlertMessage.FIELD_PROXY_UNIVERSE],
      paymentAuthorizationId: map[PaymentAuthorizationUpdatedAlert.FIELD_PAYMENT_AUTHORIZATION_ID],
      payerAccountId: ProxyAccountId(
        proxyUniverse: map[SignableAlertMessage.FIELD_PROXY_UNIVERSE],
        accountId: map[PaymentAuthorizationUpdatedAlert.FIELD_PAYER_ACCOUNT_ID],
        bankProxyId: ProxyId.fromUniqueId(map[PaymentAuthorizationUpdatedAlert.FIELD_PAYER_BANK_PROXY_ID]),
      ),
      alertId: map[SignableAlertMessage.FIELD_ALERT_ID],
      receiverProxyId: ProxyId.fromUniqueId(map[SignableAlertMessage.FIELD_RECEIVER_PROXY_ID]),
    );
  }
}
