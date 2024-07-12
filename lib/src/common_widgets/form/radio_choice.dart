import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/radio/gf_radio.dart';
import 'package:getwidget/getwidget.dart';

// Common widget for radio group
class EnumRadioGroup<T> extends StatelessWidget {
  const EnumRadioGroup({
    super.key,
    required this.enumValues, // List of enum values
    required this.selectedValue, // The Rx property holding the selected value
    required this.label,
  });

  final List<T> enumValues; // List of enum values
  final Rxn<T> selectedValue; // The Rx property holding the selected value
  final String label; // Label for the group

  String displayTextGetter(T value) {
    return value.toString().split('.').last;
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(label), // Display the label text before radio buttons
      ),
      Row(
        children: [
          // Display the label text before radio buttons
          ...enumValues.map((T value) {
            return Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Radio<T>(
                    value: value,
                    groupValue: selectedValue.value,


                    onChanged: (T? newValue) {
                      if (newValue != null) {
                        selectedValue.value =
                            newValue; // Update the selected value
                      }
                    },
                  ),
                  Text(displayTextGetter(value)), // Use the displayTextGetter
                ],
              ),
            );
          }),
        ],
      ),




    ]);
  }
}

class BoolRadioGroup extends StatelessWidget {
  const BoolRadioGroup({
    super.key,
    required this.label,
    required this.valueProperty, // The Rx property holding the selected value
  });

  final String label; // Label for the group
  final Rxn<bool> valueProperty; // The Rx property holding the selected value

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(label,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!), // Display the label text before radio buttons
        ),
        Obx(() => Row(
              children: [
                Radio<bool>(
                  value: true,
                  groupValue: valueProperty.value,
                  onChanged: (bool? newValue) {
                    if (newValue != null) {
                      valueProperty.value =
                          newValue; // Update the valueProperty directly
                    }
                  },
                ),
                const Text('Yes'),
                Radio<bool>(
                  value: false,
                  groupValue: valueProperty.value,
                  onChanged: (bool? newValue) {
                    if (newValue != null) {
                      valueProperty.value =
                          newValue; // Update the valueProperty directly
                    }
                  },
                ),
                const Text('No'),
              ],
            )),
      ],
    );
  }
}
