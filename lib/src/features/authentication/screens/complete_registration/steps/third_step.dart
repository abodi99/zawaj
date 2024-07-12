import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:zawg/src/common_widgets/form/dropdown.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/enum.dart';
import '../../../controllers/complete_registration_controller.dart';

class ThirdStep extends StatelessWidget {
  const ThirdStep({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CompleteRegistrationController());

    return Obx(
      () => Column(
        children: [


          GFButton(
            onPressed: () {
              showCountryPicker(
                context: context,
                exclude: <String>['IL', 'MF'],
                favorite: <String>['SE', 'PA'],
                showPhoneCode: false,
                onSelect: (Country country) {
                  controller.selectedCountry.value = country.name;
                  controller.selectedCountryFlag.value =
                      country.flagEmoji;
                },
              );
            },
            text: "Choose Nationality",
            shape: GFButtonShape.standard,
            fullWidthButton: true,
            size: GFSize.LARGE,
            icon: Icon(LineAwesomeIcons.globe_solid),
            color: Colors.lightGreen,
            type: GFButtonType.solid,
          ),
          const SizedBox(height: 10),
          controller.selectedCountry.value != null ?
          Row(
            children: [
              Text(
                controller.selectedCountry.value.toString(),
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(width: 15), // Add some spacing

              Text(
                controller.selectedCountryFlag.value.toString(),
                style: TextStyle(fontSize: 20),
              ),

            ],
          ) : SizedBox(),
          const SizedBox(height: 20),

          Divider(),

          const SizedBox(height: 20),

          DropdownCommon(
              enumValues: MaritalStatus.values,
              valueProperty: controller.maritalStatus,
              label: "Marital Status:"),

          // Marital Status Dropdown
          const SizedBox(height: 25),
          Divider(),

          Obx(() {
            if (controller.maritalStatus.value != MaritalStatus.FirstMarrige) {
              return Column(
                children: [
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Children ? ',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<int>(
                    value: controller.kids.value,
                    items: List.generate(11, (index) => index)
                        .map((int value) => DropdownMenuItem<int>(
                              value: value,
                              child: Text('$value'),
                            ))
                        .toList(),
                    onChanged: (int? newValue) {
                      controller.kids.value = newValue!;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Divider(),

                ],
              );
            } else {
              controller.kids.value = 0; // Set kids to 0 when Single
              return const SizedBox(height: 20,); // Return an empty SizedBox
            }
          }),

          DropdownCommon(
              enumValues: SwedishCounties.values,
              valueProperty: controller.Counties,
              label: "County"),

          const SizedBox(height: 20),
          Divider(),
          const SizedBox(height: 20),

          DropdownCommon(
              enumValues: Education.values,
              valueProperty: controller.education,
              label: "Education"),
          SizedBox(height: 15),
          Divider(),


        ],
      ),
    );
  }
}
