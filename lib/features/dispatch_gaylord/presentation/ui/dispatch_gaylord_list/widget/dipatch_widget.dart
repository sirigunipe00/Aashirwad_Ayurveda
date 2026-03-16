import 'package:flutter/material.dart';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/features/dispatch_gaylord/model/gaylord_form.dart';
import 'package:aashirwad/styles/app_colors.dart';
import 'package:aashirwad/styles/app_text_styles.dart';
import 'package:aashirwad/styles/icons.dart';
import 'package:aashirwad/widgets/widgets.dart';

class DispatchWidget extends StatelessWidget {
  const DispatchWidget({
    super.key,
    required this.onTap,
    required this.gayLord,
  });

  final GaylordForm gayLord;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppColors.white,
        surfaceTintColor: AppColors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(color: Color(0xFFFF7E4D), width: 2)),
        child: Stack(
          children: [
            Positioned.fill(
              left: context.sizeOfWidth * 0.3,
              child: Image(
                image: AssetImage(AppIcons.dispatch.path),
                fit: BoxFit.fill,
              ),
            ),
            SpacedColumn(
              defaultHeight: 4,
              margin: const EdgeInsets.all(12),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(gayLord.name,
                        style: AppTextStyles.titleLarge(context)
                            .copyWith(color: AppColors.black)),
                    Text(
                      DFU.ddMMyyyyFromStr(gayLord.currentDate),
                      style: AppTextStyles.titleMedium(
                        context,
                        AppColors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(gayLord.customer,
                          style: AppTextStyles.titleLarge(context)
                              .copyWith(color: AppColors.black)),
                    ),
                    //          AppSpacer.p4(),
                    // Text(DFU.timeLabelFromStr(gayLord.currentDate),
                    //     style: AppTextStyles.titleLarge(context)
                    //         .copyWith(color: AppColors.black)),
                  ],
                ),
                AppSpacer.p8(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ViewBtn(onPressed: onTap),
                    DocStatusWidget(
                        status:(gayLord.status) )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
