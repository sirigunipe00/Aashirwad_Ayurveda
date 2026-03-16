import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/features/gate_registration/data/gate_registration_repo.dart';
import 'package:aashirwad/features/gate_registration/model/gate_registration_form.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'gate_registration_cubit.freezed.dart';

enum GateRegistrationView { create, edit, completed }

@injectable
class GateRegistrationCubit extends AppBaseCubit<GateRegistrationState> {
  GateRegistrationCubit(this.repo) : super(GateRegistrationState.initial());

  final GateRegistrationRepo repo;

  void onValueChanged({
    String? status,
    String? name,
    String? visitorName,
    String? phoneNo,
    String? visitingDate,
    String? address1,
    String? address2,
    String? citytown,
    String? states,
    String? country,
    String? contactperson,
    String? signature,
    String? timeIn,
    String? timeOut,
    String? purpose,
    String? vehicleNo,
    String? remarks,
    File? govtIdImage,
    String? govtIdUrl,
    int? others,
  }) {
    final form = state.form;

    final newForm = form.copyWith(
      contactperson: contactperson ?? form.contactperson,
      signature: signature ?? form.signature,
      timeIn: timeIn ?? form.timeIn,
      timeOut: timeOut ?? form.timeOut,
      status: status ?? form.status,
      vehicleNo: vehicleNo ?? form.vehicleNo,
      name: name ?? form.name,
      visitingDate: visitingDate ?? form.visitingDate,
      visitorName: visitorName ?? form.visitorName,
      govtIdImage: govtIdImage ?? form.govtIdImage,
      govtIdUrl: govtIdUrl ?? form.govtIdUrl,
      phoneNo: phoneNo ?? form.phoneNo,
      address1: address1 ?? form.address1,
      address2: address2 ?? form.address2,
      citytown: citytown ?? form.citytown,
      states: states ?? form.states,
      country: country ?? form.country,
      purpose: purpose ?? form.purpose,
      remarks: remarks ?? form.remarks,
      others: others ?? form.others,
    );
    emitSafeState(state.copyWith(form: newForm, error: null));
  }

  void initDetails(Object? registration) {
    if (registration is GateRegistrationForm) {
      final isSubmitted = StringUtils.equalsIgnoreCase(
          registration.status?.trim(), 'Submitted');
      final isCancelled = StringUtils.equalsIgnoreCase(
          registration.status?.trim(), 'Cancelled');
      final mode = (isSubmitted || isCancelled)
          ? GateRegistrationView.completed
          : GateRegistrationView.edit;
      emitSafeState(state.copyWith(form: registration, view: mode));
    }
  }

  void clearGovtIdImage() {
    final form = state.form.copyWith(govtIdImage: null);
    emitSafeState(state.copyWith(form: form));
  }

  void save() async {
    final validation = _validate();
    return validation.fold(
      () async {
        emitSafeState(state.copyWith(isLoading: true, isSuccess: false));

        final nextMode = switch (state.view) {
          GateRegistrationView.create => GateRegistrationView.edit,
          GateRegistrationView.edit ||
          GateRegistrationView.completed =>
            GateRegistrationView.completed,
        };

        final status = switch (state.view) {
          GateRegistrationView.create => 'Draft',
          GateRegistrationView.edit ||
          GateRegistrationView.completed =>
            'Submitted',
        };

        final response = state.view == GateRegistrationView.create
            ? await repo.createGateRegistration(state.form)
            : await repo.submitGateRegistration(state.form);

        return response.fold(
          (l) {
            emitSafeState(state.copyWith(isLoading: false, error: l));
          },
          (r) {
            emitSafeState(state.copyWith(
              isLoading: false,
              isSuccess: true,
              form: state.form.copyWith(name: r.first, status: status),
              successMsg: r.second,
              view: nextMode,
            ));
          },
        );
      },
      _emitError,
    );
  }

  void emitOthers() {
    emitSafeState(state.copyWith());
  }

  void _emitError(String error) {
    final failure = Failure(error: error, title: 'Missing Fields');
    emitSafeState(state.copyWith(error: failure, isLoading: false));
  }

  void errorHandled() {
    emitSafeState(state.copyWith(
        error: null, isLoading: false, isSuccess: false, successMsg: null));
  }

  Option<String> _validate() {
    final form = state.form;

    if (form.visitorName.doesNotHaveValue) {
      return optionOf('Enter Visitor Name');
    } else if (form.phoneNo.isNull) {
      return optionOf('Enter Mobile Number');
    } else if (form.govtIdImage.isNull && form.govtIdUrl.isNull) {
      return optionOf('Capture government Id');
    } else if (form.address1.doesNotHaveValue) {
      return optionOf('Enter Address Line1');
    } else if (form.citytown.doesNotHaveValue) {
      return optionOf('Enter city/town Name');
    } else if (form.country.doesNotHaveValue) {
      return optionOf('Enter Country Name');
    } else if (form.contactperson.doesNotHaveValue && form.others != 1) {
      return optionOf('Select Contact Person');
    } else if (form.timeIn.doesNotHaveValue) {
      return optionOf('Select TimeIn');
    } else if (form.remarks.doesNotHaveValue && form.others == 1 ) {
      return optionOf('Enter Remarks');
    }

    if (state.view != GateRegistrationView.create) {
      if (form.timeOut == null || form.timeOut!.trim().isEmpty) {
        return optionOf('Select TimeOut');
      }
    }

    return const None();
  }
}

@freezed
class GateRegistrationState with _$GateRegistrationState {
  const factory GateRegistrationState({
    required GateRegistrationForm form,
    required bool isLoading,
    required bool isSuccess,
    required GateRegistrationView view,
    Failure? error,
    String? successMsg,
    // required bool isOthers,
  }) = _GateRegistrationState;

  factory GateRegistrationState.initial() {
    return GateRegistrationState(
      form: GateRegistrationForm(
        country: 'India',
        visitingDate: DFU.friendlyFormat(DateTime.now()),
        // timeIn: DFU.dateTimeLabel(DateTime.now()),
        // timeOut: DFU.dateTimeLabel(DateTime.now()),
      ),
      view: GateRegistrationView.create,
      isLoading: false,
      isSuccess: false,
      // isOthers: false,
    );
  }
}
