
import 'package:aashirwad/core/utils/date_format_util.dart';
import 'package:aashirwad/features/stock_transfer/model/stock_entry.dart';
import 'package:aashirwad/styles/app_colors.dart';
import 'package:aashirwad/styles/app_text_styles.dart';
import 'package:aashirwad/widgets/app_spacer.dart';
import 'package:flutter/material.dart';


class StockEntryWidget extends StatelessWidget {
  const StockEntryWidget({
    super.key,
    required this.stockEntry,
    required this.onTap,
  });

  final StockEntry stockEntry;
  final Future<bool?> Function() onTap;

  @override
  Widget build(BuildContext context) {
    final status = stockEntry.docstatus == 1
        ? 'Submitted'
        : stockEntry.docstatus == 2
            ? 'Cancelled'
            : 'Draft';

    final cardColor = switch (status) {
      'Submitted' => const Color(0xFFF0FFF4),
      'Cancelled' => const Color(0xFFFFF0F0),
      _ => const Color(0xFFFFF9E6),
    };

    final borderColor = switch (status) {
      'Submitted' => const Color(0xFFB2DFCA),
      'Cancelled' => const Color(0xFFFFB3B3),
      _ => const Color(0xFFF5E6B0),
    };

    final badgeBg = switch (status) {
      'Submitted' => const Color(0xFFC6F0D8),
      'Cancelled' => const Color(0xFFFFD6D6),
      _ => const Color(0xFFFFF0C2),
    };

    final badgeText = switch (status) {
      'Submitted' => const Color(0xFF2D7A50),
      'Cancelled' => const Color(0xFFB00020),
      _ => const Color(0xFFB8860B),
    };

    // final formattedDate = stockEntry.modified != null
    //     ? DateFormat('dd-MMM-yyyy · HH:mm').format(stockEntry.modified.)
    //     : '';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        padding: const EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row 1: Entry name + status badge
            Row(
              children: [
                Expanded(
                  child: Text(
                    stockEntry.name ?? '',
                    style: AppTextStyles.titleMedium(context, AppColors.black).copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: AppColors.black,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: badgeBg,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: badgeText.withValues(alpha: 0.4)),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: badgeText,
                    ),
                  ),
                ),
              ],
            ),
            AppSpacer.p4(),
            // Row 2: Date
            Text(
              DFU.ddMMyyyyFromStr(stockEntry.postingDate!),
              style: AppTextStyles.titleMedium(context, AppColors.black.withValues(alpha: 0.5)).copyWith(
                color: AppColors.black.withValues(alpha: 0.5),
                fontSize: 14,
              ),
            ),
            AppSpacer.p8(),

            if (stockEntry.stockEntryType != null)
              Text(
                stockEntry.stockEntryType!,
                style: AppTextStyles.titleMedium(context, AppColors.black.withValues(alpha: 0.7)).copyWith(
                  color: AppColors.black.withValues(alpha: 0.7),
                  fontSize: 14,
                ),
              ),
            AppSpacer.p4(),

            // Row(
            //   children: [
            //     if (stockEntry.totalItems != null)
            //       Text(
            //         '${stockEntry.totalItems} items',
            //         style: AppTextStyles.titleMedium(context).copyWith(
            //           color: AppColors.black.withValues(alpha: 0.5),
            //           fontSize: 11,
            //         ),
            //       ),
            //     if (stockEntry.totalItems != null &&
            //         stockEntry.totalValue != null)
            //       Text(
            //         ' · ',
            //         style: AppTextStyles.titleMedium(context).copyWith(
            //           color: AppColors.black.withValues(alpha: 0.5),
            //         ),
            //       ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}