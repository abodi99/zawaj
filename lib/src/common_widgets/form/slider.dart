import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ObservableSlider extends StatelessWidget {
  final double min;
  final double max;
  final Rx<double> valueProperty;
  final String upperText;
  final Color sliderColor;

  const ObservableSlider({super.key,
    required this.min,
    required this.max,
    required this.valueProperty,
    required this.upperText,
    required this.sliderColor,
  });

// Observable value

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(" $upperText :   ${valueProperty.value.round()}")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${min.round()}"),
              const SizedBox(width: 5),
              Slider(
                min: min,
                max: max,
                divisions: (max - min).toInt(),
                label: '${valueProperty.value.round()}', // Use observable value
                activeColor: sliderColor,
                inactiveColor: sliderColor,
                thumbColor: sliderColor,
                value: valueProperty.value, // Bind to observable value
                onChanged: (value) {
                  valueProperty.value = value; // Update observable value
                },
              ),
              const SizedBox(width: 5),
              Text("${max.round()}"),
            ],
          ),
        ],
      ),
    );
  }
}
