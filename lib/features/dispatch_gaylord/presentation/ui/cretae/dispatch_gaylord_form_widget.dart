import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/features/dispatch_gaylord/model/gaylord_form.dart';
import 'package:aashirwad/features/dispatch_gaylord/presentation/bloc/bloc_provider.dart';
import 'package:aashirwad/features/dispatch_gaylord/presentation/ui/dispatch_gaylord_list/widget/barcode_table_details.dart';
import 'package:aashirwad/styles/app_colors.dart';
import 'package:aashirwad/widgets/widgets.dart';

class DispatchGaylordFormWidget extends StatefulWidget {
  const DispatchGaylordFormWidget({
    super.key,
    required this.form,
  });

  final GaylordForm form;

  @override
  State<DispatchGaylordFormWidget> createState() => _DispatchGaylordFormWidgetState();
}

class _DispatchGaylordFormWidgetState extends State<DispatchGaylordFormWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TitleStatusAppBar(
        title: 'Dispatch Gaylord',
        docNo: widget.form.name,
        status: widget.form.status,
        textColor: AppColors.dispatchs,
        alignment: DocNoAlignment.vertical,
      ),
      body: SingleChildScrollView(
        child: SpacedColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          margin: const EdgeInsets.all(12.0),
          defaultHeight: 8,
          children: [
            InputField(
              title: 'Delivery Note Date',
              readOnly: true,
              initialValue: DFU.ddMMyyyyFromStr(widget.form.currentDate),
              suffixIcon: const Icon(Icons.calendar_month_outlined),
              isRequired: true,
              borderColor: AppColors.dispatchs,
            ),
            InputField(
              title: 'Customer',
              readOnly: true,
              initialValue: widget.form.customer,
              borderColor: AppColors.dispatchs,
              isRequired: true,
            ),
             BarcodeTableDetails(form:widget.form),
            AppSpacer.p8(),
            if (widget.form.status == "Draft")...[
                   BlocConsumer<SubmitDispatchGaylord, SubmitDispatchGaylordState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () => false,
                  success: (data) {
                    AppDialog.showSuccessDialog(context,
                        content: data, onTapDismiss: context.exit);
                  },
                  failure: (failure) {
                    AppDialog.showErrorDialog(context,
                        content: failure.error, onTapDismiss: context.exit);
                  },
                );
              },
              builder:(context, state) => 
              AppButton(
                isLoading:state.isLoading,
                  onPressed: () => context
                      .cubit<SubmitDispatchGaylord>()
                      .request(widget.form.name),
                  label: 'Submit'),
            ),

            ]
       
          ],
        ),
      ),
    );
  }

  
}
