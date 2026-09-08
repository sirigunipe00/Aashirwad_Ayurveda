import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/features/dispatch_gaylord/model/gaylord_form.dart';
import 'package:aashirwad/features/dispatch_gaylord/model/gaylord_items_form.dart';
import 'package:aashirwad/features/dispatch_gaylord/presentation/bloc/bloc_provider.dart';
import 'package:aashirwad/features/dispatch_gaylord/presentation/ui/dispatch_gaylord_list/widget/table_widget.dart';
import 'package:aashirwad/styles/app_colors.dart';
import 'package:aashirwad/widgets/widgets.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class BarcodeTableDetails extends StatefulWidget {
  const BarcodeTableDetails({super.key, required this.form});
  final GaylordForm form;

  @override
  State<BarcodeTableDetails> createState() => _BarcodeTableDetailsState();
}

class _BarcodeTableDetailsState extends State<BarcodeTableDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GaylordItemLines, GaylordItemLinesState>(
      builder: (_, state) {
        final itemLines = state
            .maybeWhen(
              orElse: () => <GaylordItemsForm>[],
              success: (data) {
                return data;
              },
            )
            .where((e) => e.scanValue != null);

        if (widget.form.status == 'Draft' && itemLines.isEmpty) {
          return Column(
            children: [
              BlocListener<UpdateDispatchGaylord, UpdateDispatchGaylordState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () => false,
                    success: (data) {
                      AppDialog.showSuccessDialog(context,
                              content: data, onTapDismiss: context.exit)
                          .then((value) {
                            if(!context.mounted) return;
                            context
                              .cubit<GaylordItemLines>()
                              .request(widget.form.name);
                          });
                    },
                    failure: (failure) {
                      AppDialog.showErrorDialog(context,
                          content: failure.error, onTapDismiss: context.exit);
                    },
                  );
                },
                child: InputField(
                  title: 'Scan Barcode',
                  readOnly: true,
                  borderColor: AppColors.dispatchs,
                  suffixIcon: IconButton(
                    onPressed: () => onScan(context, widget.form.name),
                    icon: const Icon(
                      Icons.document_scanner_outlined,
                      color: AppColors.chimneySweep,
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (itemLines.isNotEmpty) {
          List<String> lines = itemLines.map((e) => e.scanValue ?? '').toList();
          final names = itemLines.map((e) => e.name).toList()
          ..elementAt(0);

          return TableWidget(
            lines: lines,
            names: names,
            form: widget.form,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  void onScan(BuildContext context, String id) async {
   String? barcodeScanRes = await SimpleBarcodeScanner.scanBarcode(
      context,
      barcodeAppBar: const BarcodeAppBar(
        appBarTitle: 'Test',
        centerTitle: false,
        enableBackButton: true,
        backButtonIcon: Icon(Icons.arrow_back_ios),
      ),
      isShowFlashIcon: true,
      delayMillis: 2000,
      scanType: ScanType.barcode,
      cameraFace: CameraFace.back,
    );

    final isValidValue =
        barcodeScanRes.containsValidValue && barcodeScanRes != '-1';
    if (!context.mounted) return;
    if (isValidValue) {
      context.read<UpdateDispatchGaylord>().request(Pair(id, barcodeScanRes!));
    }
  }
}