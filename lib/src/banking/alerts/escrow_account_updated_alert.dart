import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/src/banking/escrow/escrow_account_id.dart';

class EscrowAccountUpdatedAlert extends Alert {
  static const ALERT_TYPE = "in.yagnyam.proxy.messages.escrow.alerts.EscrowAccountUpdatedAlert";

  final EscrowAccountId escrowAccountId;

  EscrowAccountUpdatedAlert({
    @required String alertId,
    @required String proxyUniverse,
    @required this.escrowAccountId,
  }) : super(
          alertId: alertId,
          alertType: ALERT_TYPE,
          proxyUniverse: proxyUniverse,
        );

  factory EscrowAccountUpdatedAlert.fromJson(Map<dynamic, dynamic> map) {
    EscrowAccountId escrowAccountId = EscrowAccountId(
      proxyUniverse: map[SignableAlertMessage.PROXY_UNIVERSE],
      accountId: map['accountId'],
      bankId: map['bankId'],
    );
    return EscrowAccountUpdatedAlert(
      proxyUniverse: map[SignableAlertMessage.PROXY_UNIVERSE],
      escrowAccountId: escrowAccountId,
      alertId: map[SignableAlertMessage.ALERT_ID],
    );
  }
}
