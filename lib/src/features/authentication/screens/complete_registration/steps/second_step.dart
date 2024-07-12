import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import '../../../../../common_widgets/form/dropdown.dart';
import '../../../../../common_widgets/form/radio_choice.dart';
import '../../../../../constants/enum.dart';
import '../../../controllers/complete_registration_controller.dart';

class SecondStep extends StatelessWidget {
  const SecondStep({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CompleteRegistrationController>();

    return Column(
      children: [

        EnumRadioGroup<Gender>(
          enumValues: Gender.values, // Pass the enum values
          selectedValue: controller.selectedGender,
          label: "I am: ",),
        Divider(),


        // Marital Status Dropdown
        const SizedBox(height: 20),

        Obx(() {
          if (controller.selectedGender.value == Gender.female) {
            return Column(
              children: [
                BoolRadioGroup(
                  label: 'Hijab',
                  valueProperty: controller.hijab,
                ),
                const SizedBox(height: 20),
                Divider(),
              ],
            );
          } else {
            controller.hijab.value = false; // Set kids to 0 when Single
            return const SizedBox(); // Return an empty SizedBox
          }
        }),

        EnumRadioGroup<Religion>(
          enumValues: Religion.values, // Pass the enum values
          selectedValue: controller.religion,
          label: "Muslim type: ",
        ),
        const SizedBox(height: 20),
        Divider(),

        BoolRadioGroup(
          label: 'prayer',
          valueProperty: controller.prayer,
        ),
        const SizedBox(height: 20),

        Divider(),


        BoolRadioGroup(
          label: 'fasting',
          valueProperty: controller.fasting,
        ),
        const SizedBox(height: 20),
        Divider(),

        BoolRadioGroup(
          label: 'alkohol',
          valueProperty: controller.alkohol,
        ),

        const SizedBox(height: 10),
        Divider(),

        BoolRadioGroup(
          label: 'smooking',
          valueProperty: controller.smooking,
        ),

        const SizedBox(height: 10),
        Divider(),

      ],
    );
  }
}
