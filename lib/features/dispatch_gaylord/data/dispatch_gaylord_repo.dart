import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/features/dispatch_gaylord/model/gaylord_form.dart';
import 'package:aashirwad/features/dispatch_gaylord/model/gaylord_items_form.dart';

abstract interface class DispatchGaylordRepo {
  AsyncValueOf<List<GaylordForm>> getGaylords(int start, String status, String? search);
  AsyncValueOf<List<GaylordItemsForm>> getGaylordItems(String name);
   AsyncValueOf<String> updateDispatchGaylord(String id, String barcoderesult);
   AsyncValueOf<String> removeDispatchGaylord(String id, List<String> barcodeid);
   AsyncValueOf<String> submitDispatchGaylord(String id);

  
   
}
