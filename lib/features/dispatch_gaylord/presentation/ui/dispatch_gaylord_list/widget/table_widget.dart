import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aashirwad/core/ext/context_ext.dart';
import 'package:aashirwad/core/model/pair.dart';
import 'package:aashirwad/core/utils/utils.dart';
import 'package:aashirwad/features/dispatch_gaylord/model/gaylord_form.dart';
import 'package:aashirwad/features/dispatch_gaylord/presentation/bloc/bloc_provider.dart';
import 'package:aashirwad/styles/app_colors.dart';
import 'package:aashirwad/widgets/app_spacer.dart';
import 'package:aashirwad/widgets/caption_text.dart';
import 'package:aashirwad/widgets/dialogs/app_dialogs.dart';
import 'package:aashirwad/widgets/loading_indicator.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class TableWidget extends StatefulWidget {
  final List<String> lines;
  final List<String?> names;
  final GaylordForm form;

  const TableWidget({
    super.key,
    required this.lines,
    required this.names,
    required this.form,
  });

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  bool deleteMode = false;
  bool isLoading = false;
  final Set<int> selectedRows = {};

  List<String> deletedItems = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CaptionText(title: 'Barcode Details', isRequired: true),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: context.sizeOfWidth),
            child: isLoading
                ? const Center(child: LoadingIndicator())
                : DataTable(
                    headingTextStyle: const TextStyle(
                      fontSize: 12,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    dataTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: AppColors.subtitlecolor,
                    ),
                    decoration: const BoxDecoration(color: Color(0xFFF1F1F1)),
                    border: TableBorder.all(color: const Color(0xFF808080)),
                    headingRowColor:
                        WidgetStateProperty.all(AppColors.dispatchs),
                    columns: const [
                      DataColumn(label: Center(child: Text('SI No'))),
                      DataColumn(label: Center(child: Text('Barcode Details'))),
                    ],
                    columnSpacing: 30,
                    headingRowHeight: 30,
                    horizontalMargin: 30,
                    rows: List.generate(widget.lines.length, (index) {
                      final siNo = (index + 1).toString();
                      final item = widget.lines.elementAt(index);

                      return DataRow(
                        cells: [
                          if (deleteMode)
                            DataCell(
                              Center(
                                child: Checkbox(
                                  value: selectedRows.contains(index),
                                  onChanged: (isSelected) {
                                    setState(() {
                                      if (isSelected ?? false) {
                                        selectedRows.add(index);
                                        deletedItems
                                            .add(widget.names[index] ?? '');
                                      } else {
                                        selectedRows.remove(index);
                                        deletedItems
                                            .remove(widget.names[index] ?? '');
                                      }
                                    });
                                  },
                                ),
                              ),
                            )
                          else
                            DataCell(
                              Center(
                                child: Text(
                                  siNo,
                                  style: const TextStyle(
                                    color: AppColors.dispatchs,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          DataCell(Text(item)),
                        ],
                      );
                    }),
                  ),
          ),
        ),
        AppSpacer.p4(),
        if (widget.form.status == 'Draft') ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocListener<RemoveDispatchGaylord, RemoveDispatchGaylordState>(
                listener: (context, state) {
                  final isloading = state.maybeWhen(
                    orElse: () => false,
                    loading: () => true,
                    success: (data) => false,
                    failure: (failure) => false,
                  );
                  setState(() {
                    isLoading = isloading;
                  });
                  state.maybeWhen(
                    orElse: () => false,
                    success: (data) async {
                      await AppDialog.showSuccessDialog(
                        context,
                        content: data,
                        onTapDismiss: context.exit,
                      );
                      if (!context.mounted) return;
                      context
                          .cubit<GaylordItemLines>()
                          .request(widget.form.name);
                    },
                    failure: (failure) {
                      AppDialog.showErrorDialog(
                        context,
                        content: failure.error,
                        onTapDismiss: context.exit,
                      );
                    },
                  );
                },
                child: widget.form.status == 'Submitted'
                    ? null
                    : GestureDetector(
                        onTap: () {
                          if (deleteMode) {
                            setState(() {
                              deleteSelectedItems(
                                  widget.form.name, deletedItems);
                            });
                          } else {
                            setState(() {
                              deleteMode = true;
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFC0BE),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            deleteMode ? 'Confirm Delete' : 'Delete',
                            style: const TextStyle(
                              color: Color(0xFFFF6661),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
              ),
              BlocListener<UpdateDispatchGaylord, UpdateDispatchGaylordState>(
                listener: (context, state) {
                  final isloading = state.maybeWhen(
                    orElse: () => false,
                    loading: () => true,
                    success: (data) => false,
                    failure: (failure) => false,
                  );
                  setState(() {
                    isLoading = isloading;
                  });
                  state.maybeWhen(
                    orElse: () => false,
                    success: (data) async {
                      await AppDialog.showSuccessDialog(
                        context,
                        content: data,
                        onTapDismiss: context.exit,
                      );
                      if (!context.mounted) return;
                      context
                          .cubit<GaylordItemLines>()
                          .request(widget.form.name);
                    },
                    failure: (failure) {
                      AppDialog.showErrorDialog(context,
                          content: failure.error, onTapDismiss: context.exit);
                    },
                  );
                },
                child: GestureDetector(
                  onTap: () => onScan(context, widget.form.name),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB3DAFE),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Color(0xFF2D9AFF),
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Add',
                          style: TextStyle(
                            color: Color(0xFF2D9AFF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ],
    );
  }

  void deleteSelectedItems(String id, List<String> deletedItems) {
    context.cubit<RemoveDispatchGaylord>().request(Pair(id, deletedItems));

    selectedRows.clear();

    deleteMode = false;
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