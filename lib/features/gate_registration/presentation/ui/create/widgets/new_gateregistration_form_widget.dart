import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aashirwad/app/widgets/section_head.dart';
import 'package:aashirwad/core/core.dart';
import 'package:aashirwad/features/gate_registration/model/employee_details_form.dart';
import 'package:aashirwad/features/gate_registration/model/static_data.dart';
import 'package:aashirwad/features/gate_registration/presentation/bloc/bloc_provider.dart';
import 'package:aashirwad/features/gate_registration/presentation/bloc/gate_registration/gate_registration_cubit.dart';
import 'package:aashirwad/styles/app_colors.dart';
import 'package:aashirwad/widgets/inputs/app_dropdown.dart';
import 'package:aashirwad/widgets/inputs/compact_listtile.dart';
import 'package:aashirwad/widgets/inputs/photo_selection_widget.dart';
import 'package:aashirwad/widgets/inputs/search_dropdown_list.dart';
import 'package:aashirwad/widgets/inputs/time_selection_field.dart';
import 'package:aashirwad/widgets/widgets.dart';

class NewGateregistrationFormWidget extends StatefulWidget {
  const NewGateregistrationFormWidget({super.key});

  @override
  State<NewGateregistrationFormWidget> createState() =>
      _NewGateregistrationFormWidgetState();
}

class _NewGateregistrationFormWidgetState
    extends State<NewGateregistrationFormWidget> {
  String? armed;
  String? purpose;
  String? state;
  @override
  Widget build(BuildContext context) {
    final formState = context.read<GateRegistrationCubit>().state;
    final isCreating = formState.view == GateRegistrationView.create;
    final isCompleted = formState.view == GateRegistrationView.completed;
    final form = formState.form;
    return SingleChildScrollView(
      child: SpacedColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        margin: const EdgeInsets.all(12.0),
        defaultHeight: 8,
        children: [
          InputField(
            title: 'Visitor Name',
            readOnly: isCompleted,
            isRequired: true,
            initialValue: form.visitorName,
            borderColor: AppColors.registration,
            inputFormatters: [
              UpperCaseTextFormatter(),
            ],
            onChanged: (visitorName) {
              context
                  .cubit<GateRegistrationCubit>()
                  .onValueChanged(visitorName: visitorName);
            },
          ),
          InputField(
            title: 'Phone Number',
            isRequired: true,
            readOnly: isCompleted,
            borderColor: AppColors.registration,
            initialValue: form.phoneNo,
            maxLength: 10,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[0-9]")),
            ],
            inputType: TextInputType.number,
            onChanged: (phoneNo) {
              context
                  .cubit<GateRegistrationCubit>()
                  .onValueChanged(phoneNo: phoneNo);
            },
          ),
          InputField(
            title: 'Visiting Date',
            readOnly: true,
            initialValue: form.visitingDate,
            suffixIcon: const Icon(Icons.calendar_month_outlined),
            borderColor: AppColors.registration,
          ),
          PhotoSelectionWidget(
              title: 'Government Issued Id',
              isReadOnly: isCompleted,
              isRequired: true,
              defaultValue: form.govtIdImage,
              imageUrl: form.govtIdUrl,
              onFileCapture: (image) {
                context
                    .cubit<GateRegistrationCubit>()
                    .onValueChanged(govtIdImage: image);
              }),
          const Divider(height: 1),
          const SectoinHead(title: 'Security Information'),
          InputField(
            title: 'Arrival Mode/Vehicle No.',
            borderColor: AppColors.registration,
            readOnly: isCompleted,
            maxLength: 10,
            initialValue: form.vehicleNo,
            inputFormatters: [
              UpperCaseTextFormatter(),
            ],
            suffixIcon: const Icon(Icons.pin_outlined),
            onChanged: (vehicleNo) {
              context
                  .cubit<GateRegistrationCubit>()
                  .onValueChanged(vehicleNo: vehicleNo);
            },
          ),
          InputField(
            title: 'Purpose of Visit',
            minLines: 3,
            maxLines: 6,
            initialValue: form.purpose,
            readOnly: isCompleted,
            borderColor: AppColors.registration,
            maxLength: 200,
            onChanged: (purpose) {
              context
                  .cubit<GateRegistrationCubit>()
                  .onValueChanged(purpose: purpose);
            },
          ),
          InputField(
            title: 'Address Line 1',
            initialValue: form.address1,
            readOnly: isCompleted,
            isRequired: true,
            borderColor: AppColors.registration,
            onChanged: (add1) {
              context
                  .cubit<GateRegistrationCubit>()
                  .onValueChanged(address1: add1);
            },
          ),
          InputField(
            title: 'Address Line 2',
            initialValue: form.address2,
            readOnly: isCompleted,
            borderColor: AppColors.registration,
            onChanged: (add2) {
              context
                  .cubit<GateRegistrationCubit>()
                  .onValueChanged(address2: add2);
            },
          ),
          InputField(
            title: 'City/Town',
            initialValue: form.citytown,
            readOnly: isCompleted,
            isRequired: true,
            borderColor: AppColors.registration,
            onChanged: (city) {
              context
                  .cubit<GateRegistrationCubit>()
                  .onValueChanged(citytown: city);
            },
          ),
          AppDropDown(
            items: AppStaticData.states,
            onSelected: (state) {
              context
                  .cubit<GateRegistrationCubit>()
                  .onValueChanged(states: state);
            },
            listItemBuilder: (p0, item, p2, p3) => Text(item),
            hint: 'Select State',
            readOnly: isCompleted,
            defaultSelection: form.states,
            title: 'State',
          ),
          InputField(
            title: 'Country',
            readOnly: isCompleted,
            isRequired: true,
            initialValue: form.country,
            borderColor: AppColors.registration,
            onChanged: (country) {
              context
                  .cubit<GateRegistrationCubit>()
                  .onValueChanged(country: country);
            },
          ),
          const Divider(height: 1),
          const SectoinHead(title: 'Appointment Details'),
           BlocBuilder<GateRegistrationCubit, GateRegistrationState>(
                builder: (_, state) {
                  return CheckboxListTile(
                    value: state.form.others == 1,
                    onChanged: isCompleted
                        ? null
                        : (value) {
                            context
                                .cubit<GateRegistrationCubit>()
                                .onValueChanged(
                                    others: value == true ? 1 : 0);
                            setState(() {});
                          },
                    activeColor: Colors.black,
                    checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    isThreeLine: false,
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: const Text(
                      'Other Employee',
                      style: TextStyle(
                          color: AppColors.subtitlecolor,
                          fontWeight: FontWeight.bold),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                },
              ),
              const Text('If Employee is not there in master enable the Other Employee checkbox',style: TextStyle(fontSize: 10),),
              const SizedBox(height: 10,),
          BlocBuilder<EmployeeList, EmployeeListState>(
            builder: (_, state) {
              final employees = state.maybeWhen(
                orElse: () => <EmployeeDetailsForm>[],
                success: (data) {
                  return data;
                },
              );
              return SearchDropDownList(
                items: employees,
                key: UniqueKey(),
                defaultSelection: employees
                    .where((e) => e.name == form.contactperson)
                    .firstOrNull,
                title: 'Contact Person',
                isMandatory: form.others != 1 ? true : false,
                readOnly: isCompleted,
                isloading: state.isLoading,
                futureRequest: (p0) async {
                  final where = employees.where((e) {
                    final strList = [e.name, e.employeeName].nonNulls.toList();
                    return strList
                        .caseInsensitiveSearch(p0, (str) => str)
                        .isNotEmpty;
                  });
                  return where.toList();
                },
                headerBuilder: (_, item, __) => Text(item.name),
                listItemBuilder: (_, item, __, ___) => CompactListTile(
                  title: item.name,
                  subtitle: item.employeeName,
                ),
                onSelected: (person) {
                  context
                      .cubit<GateRegistrationCubit>()
                      .onValueChanged(contactperson: person.name);
                },
              );
            },
          ),
          TimeSelectionField(
            title: 'Time In ',
            initialValue: StringUtils.trimTime(form.timeIn),
            readOnly: isCompleted,
            onTimeSelect: (time) {
              final formattedTime = '${time.hour.toString().padLeft(2, '0')}:'
                  '${time.minute.toString().padLeft(2, '0')}:00';

              context
                  .cubit<GateRegistrationCubit>()
                  .onValueChanged(timeIn: formattedTime);
            },
            borderColor: AppColors.registration,
            suffixIcon: const Icon(
              Icons.access_time_filled,
              color: AppColors.black,
            ),
          ),
          if (!isCreating)
            TimeSelectionField(
              title: 'Time Out',
              readOnly: isCompleted,
              initialValue:
                  isCompleted ? StringUtils.trimTime(form.timeOut) : null,
              onTimeSelect: (time) {
                final formattedTime = '${time.hour.toString().padLeft(2, '0')}:'
                    '${time.minute.toString().padLeft(2, '0')}:00';

                context
                    .cubit<GateRegistrationCubit>()
                    .onValueChanged(timeOut: formattedTime);
              },
              borderColor: AppColors.registration,
              suffixIcon: const Icon(
                Icons.access_time_filled,
                color: AppColors.black,
              ),
            ),
          InputField(
            title: 'Signature of Security',
            controller: TextEditingController(text: context.user.email),
            readOnly: true,
            initialValue: form.signature,
            borderColor: AppColors.registration,
            onChanged: (signature) {
              context
                  .cubit<GateRegistrationCubit>()
                  .onValueChanged(signature: signature);
            },
          ),
          InputField(
            title: 'Remarks',
            minLines: 3,
            isRequired: form.others == 1 ? true : false,
            maxLines: 6,
            initialValue: form.remarks,
            readOnly: isCompleted,
            borderColor: AppColors.registration,
            maxLength: 200,
            onChanged: (remarks) {
              context
                  .cubit<GateRegistrationCubit>()
                  .onValueChanged(remarks: remarks);
            },
          ),
          if (!isCompleted) ...[
            BlocBuilder<GateRegistrationCubit, GateRegistrationState>(
              builder: (_, state) => AppButton(
                label: isCreating ? 'Save' : 'Submit',
                isLoading: state.isLoading,
                bgColor: AppColors.haintBlue,
                margin: const EdgeInsets.all(12.0),
                onPressed: () => context.cubit<GateRegistrationCubit>().save(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
