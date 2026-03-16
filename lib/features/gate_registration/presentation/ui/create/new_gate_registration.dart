import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/features/gate_registration/presentation/bloc/bloc_provider.dart';
import 'package:aashirwad/features/gate_registration/presentation/bloc/gate_registration/gate_registration_cubit.dart';
import 'package:aashirwad/features/gate_registration/presentation/bloc/gate_registration_filter/gate_registration_filter.dart';
import 'package:aashirwad/features/gate_registration/presentation/ui/create/widgets/new_gateregistration_form_widget.dart';
import 'package:aashirwad/styles/app_colors.dart';
import 'package:aashirwad/widgets/dialogs/app_dialogs.dart';
import 'package:aashirwad/widgets/simple_app_bar.dart';
import 'package:aashirwad/widgets/title_status_app_bar.dart';

class NewGateRegistration extends StatefulWidget {
  const NewGateRegistration({super.key});

  @override
  State<NewGateRegistration> createState() => _NewGateRegistrationState();
}

class _NewGateRegistrationState extends State<NewGateRegistration> {
  @override
  Widget build(BuildContext context) {
    final gateRegistrationtate = context.read<GateRegistrationCubit>().state;
    final form = gateRegistrationtate.form;
    final status = form.status;
    final name = form.name;

    final isNew = gateRegistrationtate.view == GateRegistrationView.create;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: isNew
          ? const SimpleAppBar(title: 'New Visitor Registration')
          : TitleStatusAppBar(
              title: 'Visitor Registration',
              docNo: name.valueOrEmpty,
              status: status.valueOrEmpty,
              textColor: AppColors.registration,
            ) as PreferredSizeWidget,
      body: BlocListener<GateRegistrationCubit, GateRegistrationState>(
          listener: (_, state) async {
            if (state.isSuccess && state.successMsg.isNotNull) {
              AppDialog.showSuccessDialog(
                context,
                title: 'Success',
                content: state.successMsg.valueOrEmpty,
                onTapDismiss: context.exit,
              ).then(
                (_) {
                  if(!context.mounted) return;
                  final filter = context.read<GateRegistrationFilterCubit>().state;
                  context
                    ..cubit<GateRegistrationsCubit>().fetchInitial(filter)
                    ..cubit<GateRegistrationCubit>().errorHandled();
                },
              );
              setState(() {});
            }
            if (state.error.isNotNull) {
              await AppDialog.showErrorDialog(
                context,
                title: state.error!.title,
                content: state.error!.error,
                onTapDismiss: context.exit,
              );
              if(!context.mounted) return;
              context.cubit<GateRegistrationCubit>().errorHandled();
            }
          },
          child: NewGateregistrationFormWidget(key: ValueKey(status))),
    );
  }
}
