import 'package:aashirwad/core/consts/doctypes.dart';
import 'package:aashirwad/core/core.dart';

final _reqisteredUrl = $sl.get<Urls>(instanceName: 'baseUrl');

class Urls {
  // factory Urls.aashirwadUAT() => const Urls('https://aashirwadUAT.easycloud.co.in/api');
  factory Urls.aashirwadUAT() => const Urls('https://ashirwaduat.easycloud.co.in/api');
  factory Urls.aashirwadProd() => const Urls('https://htpllive.easycloud.co.in/api');
  factory Urls.local() => const Urls('192.168.0.142:8000/api');

  const Urls(this.url);

  final String url;

  static bool get isTest => Uri.parse(_reqisteredUrl.url)
      .authority
      .split('.')
      .first
      .toLowerCase()
      .contains('uat');

  static final baseUrl = _reqisteredUrl.url;
  static final jsonWs = '$baseUrl/resource';
  static final cusWs = '$baseUrl/method';

  static final appUpdate = '$cusWs/easy_common.api.get_app_version';

  static final login = '$cusWs/login';
  static final getUsers = '$cusWs/easygateentry.api.getUsers';

  static final gateEntryList = '$cusWs/easygateentry.api.getGateEntry';
  static final getGateEntry = '$cusWs/easygateentry.api.getGateEntryDetails';
  static final newGateEntry = '$cusWs/easygateentry.api.createGateEntry';
  static final submitGateEntry = '$cusWs/easygateentry.api.submitGateEntry';

  static final gateExitList = '$cusWs/easygateentry.api.getGateExit';
  static final getGateExit = '$cusWs/easygateentry.api.getGateExitDetails';
  static final newGateExit = '$cusWs/easygateentry.api.createGateExit';
  static final submitGateExit = '$cusWs/easygateentry.api.submitGateExit';
  static final getVehicleNumber = '$cusWs/easygateentry.api.getvehiclenumberfromsalesinvoice';
  static final poList = '$cusWs/easygateentry.api.po_list';
  
  static final getVisitorsList ='$cusWs/easygateentry.api.getVisitorRegistration';
  static final newGateRegistration ='$cusWs/easygateentry.api.CreateVisitorRegistration';
  static final submitGateRegistration ='$cusWs/easygateentry.api.submitVisitorRegistration';
  static final employeeList ='$jsonWs/${DocTypes.employee}';

  // Dashboard
  static final getDashboardList = '$cusWs/insights.api.dashboards.get_dashboard_list';
  static final setValue = '$cusWs/aashirwad.client.set_value';
  static final getPublicKey = '$cusWs/insights.api.public.get_public_key';

  static final getPurchaseOrders = '$cusWs/hilltop.api.get_purchase_orders';
  static final getPoOrderItems = '$cusWs/hilltop.api.get_purchase_order_items';
  static final approvePO ='$cusWs/hilltop.api.purchase_order_approval';
  static final userPermission ='$cusWs/hilltop.api.check_user_permission';


  static final getDispatchList = '$cusWs/easygateentry.api.get_dispatch_list';
  static final getGaylord = '$cusWs/easygateentry.api.get_dispatch_gaylord';
  static final updateDispatchGaylord = '$cusWs/easygateentry.api.update_dispatch_gaylord';
  static final removeDispatchGaylord = '$cusWs/easygateentry.api.remove_barcode';
  static final submitDispatchGaylord = '$cusWs/easygateentry.api.submit_gaylord';
  static final poApprovalAttachments = '$cusWs/hilltop.api.get_po_with_attachments';

  static filepath(String path) {
    return '${baseUrl.replaceAll('api', '')}/${path.replaceAll('/private', '').replaceAll("///", '/')}';
  }
}
