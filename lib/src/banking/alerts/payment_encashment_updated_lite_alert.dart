import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/proxy_account_id.dart';

import 'payment_encashment_updated_alert.dart';

class PaymentEncashmentUpdatedLiteAlert extends LiteAlert {
  final String paymentAuthorizationId;

  final String paymentEncashmentId;

  final ProxyAccountId payerAccountId;

  PaymentEncashmentUpdatedLiteAlert({
    @required String alertId,
    @required String proxyUniverse,
    @required ProxyId receiverProxyId,
    @required this.paymentAuthorizationId,
    @required this.paymentEncashmentId,
    @required this.payerAccountId,
  }) : super(
          alertId: alertId,
          alertType: PaymentEncashmentUpdatedAlert.ALERT_TYPE,
          proxyUniverse: proxyUniverse,
          receiverProxyId: receiverProxyId,
        );

  factory PaymentEncashmentUpdatedLiteAlert.fromJson(Map<dynamic, dynamic> map) {
    return PaymentEncashmentUpdatedLiteAlert(
      proxyUniverse: map[SignableAlertMessage.FIELD_PROXY_UNIVERSE],
      paymentAuthorizationId: map[PaymentEncashmentUpdatedAlert.FIELD_PAYMENT_AUTHORIZATION_ID],
      paymentEncashmentId: map[PaymentEncashmentUpdatedAlert.FIELD_PAYMENT_ENCASHMENT_ID],
      payerAccountId: ProxyAccountId(
        proxyUniverse: map[SignableAlertMessage.FIELD_PROXY_UNIVERSE],
        accountId: map[PaymentEncashmentUpdatedAlert.FIELD_PAYER_ACCOUNT_ID],
        bankProxyId: ProxyId.fromUniqueId(map[PaymentEncashmentUpdatedAlert.FIELD_PAYER_BANK_PROXY_ID]),
      ),
      alertId: map[SignableAlertMessage.FIELD_ALERT_ID],
      receiverProxyId: ProxyId.fromUniqueId(map[SignableAlertMessage.FIELD_RECEIVER_PROXY_ID]),
    );
  }
}
