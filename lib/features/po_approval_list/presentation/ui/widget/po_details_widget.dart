import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/features/po_approval_list/model/po_approval.dart';
import 'package:aashirwad/features/po_approval_list/presentation/bloc/bloc_provider.dart';
import 'package:aashirwad/features/po_approval_list/presentation/ui/widget/aicompare_quotation_button.dart';
import 'package:aashirwad/features/po_approval_list/presentation/ui/widget/po_approval_btns.dart';
import 'package:aashirwad/features/po_approval_list/presentation/ui/widget/po_title_value_widget.dart';
import 'package:aashirwad/styles/app_colors.dart';
import 'package:aashirwad/widgets/widgets.dart';

class PoDetailsWidget extends StatelessWidget {
  const PoDetailsWidget({super.key, required this.form});
  final PoApprovalForm form;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // const AicompareQuotationButton(),

        const Align(
          alignment: Alignment.centerRight,
          child: AnimatedGlowButton()),

        const SizedBox(height: 10,),

        //  PrettyNeumorphicButton(
        //         label: 'Pretty Neumorphic Button',
        //         onPressed: () {},
        //       ),
              
        Container(
          decoration: BoxDecoration(
            color: AppColors.blueshade,
            border: Border.all(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: AppColors.titlecolor.withOpacity(0.7),
                offset: const Offset(0, 5),
              ),
            ],
          ),
          padding: const EdgeInsets.all(8.0),
          child: SpacedColumn(
            defaultHeight: 8.0,
            margin: const EdgeInsets.all(4.0),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: POTitleValueWidget(
                      leading: Icons.person,
                      title: 'Vendor Name',
                      subtitle: form.vendor,
                    ),
                  ),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Grand Total',style: TextStyle(color: AppColors.titlecolor,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 5,),
                      Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(color: AppColors.titlecolor),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Text(
                      NumUtils.inRupeesFormat(form.grandTotal),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  const Row(
                    children: [
                      Text('\u2022',style: TextStyle(color: Colors.red),),
                      SizedBox(width: 3,),
                      Text('Inclusive of all the taxes',style: TextStyle(color: AppColors.titlecolor,fontSize: 10),),
                    ],
                  ),
                    ],
                  ),
                  
                ],
              ),
              Flexible(
                child: POTitleValueWidget(
                  leading: Icons.content_paste_rounded,
                  title: 'Required By',
                  subtitle: DFU.ddMMyyyyFromStr(form.requiredBy),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: POTitleValueWidget(
                      leading: Icons.calendar_month,
                      title: 'Created Date',
                      subtitle: DFU.ddMMyyyyFromStr(form.creationDate),
                    ),
                  ),
                  AppSpacer.p8(),
                  Flexible(
                    child: POTitleValueWidget(
                      leading: Icons.schedule,
                      title: 'Creation Time',
                      subtitle: DFU.timeLabelFromStr(form.creationDate),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 0),
              BlocBuilder<POPermissionCubit, POPermissionState>(
                builder: (_, state) {
                  final canapprove = state.maybeWhen(
                    orElse: () => false,
                    success: (data) => data,
                  );
                  return POApprovalButtons(
                    form: form,
                    po: form.name,
                    canApprove: canapprove,
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
