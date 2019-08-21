import 'package:meta/meta.dart';
import 'package:proxy_core/core.dart';
import 'package:proxy_messages/escrow.dart';
import 'package:proxy_messages/src/banking/escrow/escrow_account_id.dart';

class EscrowAccountUpdatedLiteAlert extends LiteAlert {
  final EscrowAccountId escrowAccountId;

  EscrowAccountUpdatedLiteAlert({
    @required String alertId,
    @required String proxyUniverse,
    @required ProxyId receiverProxyId,
    @required this.escrowAccountId,
  }) : super(
          alertId: alertId,
          alertType: EscrowAccountUpdatedAlert.ALERT_TYPE,
          proxyUniverse: proxyUniverse,
          receiverProxyId: receiverProxyId,
        );

  factory EscrowAccountUpdatedLiteAlert.fromJson(Map<dynamic, dynamic> map) {
    return EscrowAccountUpdatedLiteAlert(
      proxyUniverse: map[SignableAlertMessage.FIELD_PROXY_UNIVERSE],
      escrowAccountId: EscrowAccountId(
        proxyUniverse: map[SignableAlertMessage.FIELD_PROXY_UNIVERSE],
        accountId: map[EscrowAccountUpdatedAlert.FIELD_ESCROW_ACCOUNT_ID],
        bankProxyId: ProxyId.fromUniqueId(map[EscrowAccountUpdatedAlert.FIELD_BANK_PROXY_ID]),
      ),
      alertId: map[SignableAlertMessage.FIELD_ALERT_ID],
      receiverProxyId: ProxyId.fromUniqueId(map[SignableAlertMessage.FIELD_RECEIVER_PROXY_ID]),
    );
  }
}
