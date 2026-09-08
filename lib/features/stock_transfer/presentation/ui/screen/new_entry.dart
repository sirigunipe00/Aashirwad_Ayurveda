
import 'package:aashirwad/features/stock_transfer/model/stock_entry.dart';
import 'package:aashirwad/features/stock_transfer/model/stock_items.dart';
import 'package:aashirwad/features/stock_transfer/presentation/bloc/create_stock_entry_cubit.dart/stock_entry_cubit.dart';
import 'package:aashirwad/features/stock_transfer/presentation/ui/screen/barcode_scanner.dart';
import 'package:aashirwad/widgets/dialogs/app_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class NewStockEntry extends StatefulWidget {
  const NewStockEntry({super.key, this.stockEntryName});
  final String? stockEntryName;

  @override
  State<NewStockEntry> createState() => _NewStockEntryState();
}

class _NewStockEntryState extends State<NewStockEntry> {
  final TextEditingController _serialController = TextEditingController();
  final FocusNode _serialFocus = FocusNode();
  bool _hasPopped = false; 
  


  static const _purple = Color(0xFF9B82DB);
  static const _lightPurple = Color(0xFFF0ECFA);
  static const _bg = Color(0xFFF3F0FA);

 @override

void initState() {
  super.initState();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    final existingName = widget.stockEntryName;

    if (existingName != null && existingName.isNotEmpty) {
      context.read<NewStockEntryCubit>().loadEntry(existingName);
    }
  });
}

  @override
  void dispose() {
    _serialController.dispose();
    _serialFocus.dispose();
    super.dispose();
  }

//  void _onScan() {
//   final serial = _serialController.text.trim();

//   if (serial.isEmpty) return;

//   _serialController.clear();

//   context.read<NewStockEntryCubit>().scanSerial(serial);
// }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewStockEntryCubit, NewStockEntryState>(
    listener: (context, state) {
  state.maybeWhen(
    submitted: () {
      if (_hasPopped) return;
      _hasPopped = true;
      AppDialog.showSuccessDialog(
        context,
        content: 'Transfer submitted successfully!',
        onTapDismiss: () {
          context..pop(true) 
          ..pop(true); 
        },
      );
    },
    error: (msg) {
      AppDialog.showErrorDialog(
        context,
        title: 'Error',
        content: msg,
        onTapDismiss: () => context.pop(),
      );
    },
    orElse: () {},
  );
},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: _bg,
          body: state.when(
            initial: () => _buildReady(
    context,
    stockEntryName: '',
    entry: null,
    items: const [],
    isScanning: false,
    isSubmitting: false,
    scanError: null,
  ),
  creating: () => _buildCreating(),
            error: (msg) => _buildErrorState(msg),
            submitted: () => _buildCreating(),
            ready: (
              name,
              entry,
              items,
              isScanning,
              isSubmitting,
              scanError,
            ) =>
                _buildReady(
              context,
              stockEntryName: name ?? '',
              entry: entry,
              items: items,
              isScanning: isScanning,
              isSubmitting: isSubmitting,
              scanError: scanError,
            ),
          ),
        );
      },
    );
  }

  Widget _buildCreating() {
    return Column(
      children: [
        _buildAppBar(stockEntryName: null),
        const Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(color: _purple),
                SizedBox(height: 16),
                Text('Loading stock entry...',
                    style: TextStyle(color: Color(0xFF888888))),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorState(String msg) {
    return Column(
      children: [
        _buildAppBar(stockEntryName: null),
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 48),
                const SizedBox(height: 12),
                Text(msg,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 16),
                ElevatedButton(
  onPressed: () {
    final existingName = widget.stockEntryName;
    if (existingName != null && existingName.isNotEmpty) {
      context.read<NewStockEntryCubit>().loadEntry(existingName);
    } else {

      context.read<NewStockEntryCubit>().reset();
    }
  },
  style: ElevatedButton.styleFrom(backgroundColor: _purple),
  child: const Text('Retry', style: TextStyle(color: Colors.white)),
),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReady(
    BuildContext context, {
    required String stockEntryName,
    StockEntry? entry,
    required bool isScanning,
    required List<StockItems> items,
    required bool isSubmitting,
    String? scanError,
  }) {
    // final items = state.items;
    final isSubmitted = (entry?.docstatus ?? 0) == 1;
    final scannedCount =
        items.fold<int>(0, (sum, i) => sum + (i.qty?.toInt() ?? 1));
    // final totalAmount = items.fold<double>(
    //     0, (sum, i) => sum + ((i.qty ?? 1) * (i.basicRate ?? 0)));

    return Column(
      children: [
        _buildAppBar(stockEntryName: stockEntryName),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               if(!isSubmitted)
                _buildScanTile(
                  hasItems: items.isNotEmpty,
                  isScanning: isScanning,
                  isSubmitted: isSubmitted,
                  stockEntryName: stockEntryName,
                ),
                const SizedBox(height: 12),

                // _buildSerialInput(stockEntryName, isScanning,isSubmitted),

                if (scanError != null) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red.shade200),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.error_outline,
                            color: Colors.red.shade400, size: 16),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(scanError,
                              style: TextStyle(
                                  color: Colors.red.shade700, fontSize: 12)),
                        ),
                      ],
                    ),
                  ),
                ],

                const SizedBox(height: 5),

                _buildScannedTodayBanner(scannedCount, stockEntryName),

                const SizedBox(height: 14),

                if (items.isNotEmpty) ...[
                  const Text(
                    'Scanned items',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF333333)),
                  ),
                  const SizedBox(height: 8),
                  ...items.map((item) => _buildItemCard(item)),
                  const SizedBox(height: 12),

                  // Container(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 14, vertical: 12),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(10),
                  //     border: Border.all(color: const Color(0xFFE8E8E8)),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       const Text('Total amount',
                  //           style: TextStyle(
                  //               fontSize: 13,
                  //               fontWeight: FontWeight.w500,
                  //               color: Color(0xFF555555))),
                  //       Text(
                  //         '₹${_formatCurrency(totalAmount)}',
                  //         style: const TextStyle(
                  //             fontSize: 14,
                  //             fontWeight: FontWeight.w700,
                  //             color: Color(0xFF333333)),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ],
            ),
          ),
        ),
        if (!isSubmitted)
        _buildSubmitButton(
          stockEntryName: stockEntryName,
          isSubmitting: isSubmitting,
          hasItems: items.isNotEmpty,
        ),
      ],
    );
  }

  Widget _buildAppBar({required String? stockEntryName}) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF9B82DB), Color(0xFFB89FE8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                children: [

GestureDetector(
  onTap: () {
   
    context.pop(); 
  },
  child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
),
                  const Expanded(
                    child: Text(
                      'Scan machines',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
  onTap: () {
    final existingName = widget.stockEntryName; 
    if (existingName != null && existingName.isNotEmpty) {
      context.read<NewStockEntryCubit>().loadEntry(existingName);
    } 
  },
  child: const Icon(Icons.sync, color: Colors.white, size: 20),
),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('FQC Warehouse',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, color: Colors.white, size: 14),
                  SizedBox(width: 8),
                  Text('Finished Goods',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScanTile({
    required bool hasItems,
    required bool isScanning,
    required String stockEntryName,
    required bool isSubmitted,
  }) {
    if (isScanning) {
      
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 28),
        decoration: BoxDecoration(
          color: _lightPurple,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
              color: _purple.withValues(alpha: 0.4), style: BorderStyle.solid),
        ),
        child: const Column(
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(color: _purple, strokeWidth: 2),
            ),
            SizedBox(height: 10),
            Text('Scanning...',
                style: TextStyle(
                    color: _purple, fontSize: 14, fontWeight: FontWeight.w500)),
          ],
        ),
      );
    }

    return GestureDetector(
     onTap: isSubmitted
    ? null
    : () => _openScanner(stockEntryName),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 28),
        decoration: BoxDecoration(
          color: _lightPurple,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _purple.withValues(alpha: 0.4),
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: _purple.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.qr_code_2, color: _purple, size: 32),
            ),
            const SizedBox(height: 10),
            Text(
              hasItems ? 'Scan next machine' : 'Tap to scan barcode',
              style: const TextStyle(
                  color: _purple, fontSize: 14, fontWeight: FontWeight.w600),
            ),
            if (!hasItems) ...[
              const SizedBox(height: 4),
              const Text('or enter serial manually',
                  style: TextStyle(color: Color(0xFF999999), fontSize: 12)),
            ],
          ],
        ),
      ),
    );
  }
bool _isScannerOpen = false;

Future<void> _openScanner(String stockEntryName) async {
  if (_isScannerOpen || !mounted) return;

  _isScannerOpen = true;

  try {
    final barcode = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (_) => const BarcodeScannerScreen(),
      ),
    );

    if (!mounted) return;
if (barcode != null && barcode.isNotEmpty) {
  final cleaned = barcode.trim(); // ← add this
  if (cleaned.isNotEmpty) {
    context.read<NewStockEntryCubit>().scanSerial(cleaned);
  }
}
  } finally {
    _isScannerOpen = false;
  }
}

  // Widget _buildSerialInput(String stockEntryName, bool isScanning , bool isSubmitted) {
  //   return Container(
  //     height: 42,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(10),
  //       border: Border.all(color: const Color(0xFFE0E0E0)),
  //     ),
  //     child: Row(
  //       children: [
  //         const SizedBox(width: 12),
  //         Icon(Icons.keyboard, color: Colors.grey.shade400, size: 16),
  //         const SizedBox(width: 8),
  //         Expanded(
  //           child: TextField(
  //             controller: _serialController,
  //             focusNode: _serialFocus,
  //             enabled: !isScanning && !isSubmitted,
  //             onSubmitted: (_) => _onScan(stockEntryName),
  //             style: const TextStyle(fontSize: 13),
  //             decoration: const InputDecoration(
  //               hintText: 'Enter serial number...',
  //               hintStyle: TextStyle(color: Color(0xFFBBBBBB), fontSize: 13),
  //               border: InputBorder.none,
  //               isDense: true,
  //             ),
  //           ),
  //         ),
  //         GestureDetector(
  //           onTap: (isScanning || isSubmitted)
  //   ? null
  //   : () => _onScan(stockEntryName),
  //           child: Container(
  //             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  //             child: Icon(Icons.send,
  //                 color: isScanning ? Colors.grey : _purple, size: 18),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildScannedTodayBanner(int count, String stockEntryName) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE8E8E8)),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Scanned today',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 2),
              Text(stockEntryName,
                  style:
                      const TextStyle(fontSize: 16, color: Color(0xFF999999))),
            ],
          ),
          const Spacer(),
          Text('$count',
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w700, color: _purple)),
          const SizedBox(width: 4),
          const Text('machines',
              style: TextStyle(fontSize: 15, color: Color(0xFF999999))),
        ],
      ),
    );
  }

 Widget _buildItemCard(StockItems item) {
  final qty = item.qty?.toInt() ?? 1;

  final serials = (item.serialNo ?? '')
      .split('\n')
      .where((e) => e.trim().isNotEmpty)
      .toList();

  return Container(
    margin: const EdgeInsets.only(bottom: 8),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: const Color(0xFFF0FFF4),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: const Color(0xFFB2DFCA)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.itemName ?? '',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),

        const SizedBox(height: 12),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: serials.map((serial) {
            return SizedBox(
              width: (MediaQuery.of(context).size.width - 70) / 2,
              child: Text(
                serial,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF666666),
                ),
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 12),

        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFB2DFCA)),
            ),
            child: Column(
              children: [
                Text(
                  '$qty',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Color(0xFF2D7A50),
                  ),
                ),
                const Text(
                  'unit',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF999999),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

  // ── Submit button ─────────────────────────────────────────────────────────
  Widget _buildSubmitButton({
    required String stockEntryName,
    required bool isSubmitting,
    required bool hasItems,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 24),
      decoration: const BoxDecoration(
        color: Color(0xFFF3F0FA),
        border: Border(top: BorderSide(color: Color(0xFFE0E0E0))),
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: (hasItems && !isSubmitting)
              ? () => context
                  .read<NewStockEntryCubit>()
                  .submitTransfer(stockEntryName)
              : null,
          icon: isSubmitting
              ? const SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(
                      color: Colors.white, strokeWidth: 2))
              : const Icon(Icons.check, size: 18),
          label: Text(isSubmitting ? 'Submitting...' : 'Submit transfer'),
          style: ElevatedButton.styleFrom(
            backgroundColor: _purple,
            disabledBackgroundColor: const Color(0xFFCCBBEE),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
