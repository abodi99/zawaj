import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zawg/src/utils/theme/widget_themes/outlined_button_theme.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../features/authentication/controllers/complete_registration_controller.dart';

class DropdownCommon<T> extends StatelessWidget {
  const DropdownCommon({
    super.key,
    required this.enumValues, // List of enum values
    required this.valueProperty,
    required this.label,
  });

  final List<T> enumValues; // List of enum values
  final Rx<T> valueProperty; // The Rx property holding the selected value
  final String label; // Label for the group

  // Default display text getter
  String displayTextGetter(T value) {
    return value.toString().split('.').last;
  }

  @override
  Widget build(BuildContext context) {
    Get.put(CompleteRegistrationController());

    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(label, style: Theme.of(context).textTheme.headlineSmall,), // Display the label text before radio buttons
        ),
        const SizedBox(height: 10),

        Obx(() => DropdownButtonFormField<T>(
       //   decoration: Theme.of(context).inputDecorationTheme,
              value: valueProperty.value,
          hint: Text("Select a value"), // Add the hint text here
              items: enumValues.map((T value) {
                return DropdownMenuItem<T>(
                  value: value,

                  child:
                      Text(displayTextGetter(value)), // Use displayTextGetter
                );
              }).toList(),
              onChanged: (T? newValue) {
                if (newValue != null) {
                  valueProperty.value =
                      newValue; // Update the valueProperty directly
                }
              },
            )),
      ],
    );
  }
}
