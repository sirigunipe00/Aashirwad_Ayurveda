import 'package:flutter/material.dart';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/features/gate_registration/model/gate_registration_form.dart';
import 'package:aashirwad/styles/app_colors.dart';
import 'package:aashirwad/styles/app_text_styles.dart';
import 'package:aashirwad/styles/icons.dart';
import 'package:aashirwad/widgets/widgets.dart';

class GateRegistrationWidget extends StatelessWidget {
  const GateRegistrationWidget({
    super.key,
    required this.gateRegistration,
    required this.onTap,
  });

  final GateRegistrationForm gateRegistration;
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
            side: const BorderSide(color: Color(0xFFB4DF90), width: 2)),
        child: Stack(
          children: [
            Positioned.fill(
              left: context.sizeOfWidth * 0.3,
              child: Image(
                image: AssetImage(AppIcons.registrations.path),
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
                    Text(gateRegistration.name!,
                        style: AppTextStyles.titleLarge(context)
                            .copyWith(color: AppColors.black)),
                    Column(
                      children: [
                        Text(
                          gateRegistration.visitingDate!,
                          style: AppTextStyles.titleMedium(
                            context,
                            AppColors.black,
                          ),
                        ),
                        Text(
                            StringUtils.trimTime(
                              gateRegistration.timeIn.valueOrEmpty,
                            ),
                            style: const TextStyle(
                                fontSize: 10, color: AppColors.black))
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(gateRegistration.visitorName!,
                        style: AppTextStyles.titleLarge(context)
                            .copyWith(color: AppColors.black)),
                    Text(
                      gateRegistration.contactpersonName ?? gateRegistration.contactperson.valueOrEmpty,
                      style: AppTextStyles.labelLarge(context)
                          .copyWith(color: AppColors.black),
                    )
                  ],
                ),
                AppSpacer.p8(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ViewBtn(onPressed: onTap),
                    DocStatusWidget(
                        status: gateRegistration.status.valueOrEmpty)
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
