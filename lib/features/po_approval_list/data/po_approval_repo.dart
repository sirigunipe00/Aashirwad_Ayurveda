import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/features/po_approval_list/model/po_approval.dart';
import 'package:aashirwad/features/po_approval_list/model/po_approval_attachments.dart';
import 'package:aashirwad/features/po_approval_list/model/po_order_items.dart';

abstract interface class PoApprovalRepo {
  AsyncValueOf<List<PoApprovalForm>> getPurchaseOrders(int start, String status, String? search);
  AsyncValueOf<List<PoOrderItemsForm>> getPoOrderItems(String name);
  AsyncValueOf<bool> userPermission( String name);
  AsyncValueOf<None> approvePOButton(String orderiD, String action);
  AsyncValueOf<None> rejectPOButton(String orderiD, String reason,String action);
  AsyncValueOf<List<PoApprovalAttachments>> poApprovalAttachments(String poApprovalname);
  AsyncValueOf<Uint8List> loadPDF(String url);

  AsyncValueOf<None> downloadFiles(String name, List<String> urls);
}
