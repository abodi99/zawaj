import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:zawg/src/constants/colors.dart';

import '../../../../../common_widgets/form/age-calculater.dart';
import '../../../controllers/complete_registration_controller.dart';

List<ColorSwatch> createMaterialColor(List<Color> colors) {
  return colors
      .map((color) => ColorSwatch(color.value, {
            50: color.withOpacity(0.1),
            100: color.withOpacity(0.2),
            200: color.withOpacity(0.3),
            300: color.withOpacity(0.4),
            400: color.withOpacity(0.5),
            500: color.withOpacity(0.6),
            600: color.withOpacity(0.7),
            700: color.withOpacity(0.8),
            800: color.withOpacity(0.9),
            900: color,
          }))
      .toList();
}

class FirstStep extends StatelessWidget {
  const FirstStep({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CompleteRegistrationController>();

    final skinColors = createMaterialColor([
      Color(0xFFF8EBC8), // Light skin tone
      Color(0xFFF1C27D), // Medium light skin tone
      Color(0xFFE08D54), // Medium skin tone
      Color(0xFFC68642), // Medium dark skin tone
      Color(0xFF8D5524), // Dark skin tone
    ]);

    return Obx(
      () => Column(children: [
        const SizedBox(height: 10),

        Align(
          alignment: Alignment.centerLeft,
          child: Text(
              "Skin Color",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.left,

          ),
        ),
        const SizedBox(height: 20),
        MaterialColorPicker(
          onColorChange: (Color color) {
            // Handle color changes
            controller.skinColor.value = color;
          },
          allowShades: false, // default true

          selectedColor: controller.skinColor.value,
          colors: skinColors,
        ),
        const SizedBox(height: 30),

        Divider(),

        const SizedBox(height: 30),
        AgeCalculater(),
        Text(controller.age.value.toString()),
        const SizedBox(height: 30),

        Divider(),


/*
        SizedBox(height: 30),
        Text("your weight in kg : ${controller.weight.value.round()}"),
        SfSlider(
          stepSize: 1,
          min: 40.0,
          max: 200.0,
          value: controller.weight.value,
          interval: 40,
          showTicks: true,
          showLabels: true,
          enableTooltip: true,
          minorTicksPerInterval: 0,
          onChanged: (value) {
            controller.weight.value = value; // Update observable value
          },
          thumbIcon: Icon(
            LineAwesomeIcons.ruler_horizontal_solid,
            size: 20,
          ),
        ),
        */
        SizedBox(height: 30),



        SfSlider(
          stepSize: 1,
          min: 140.0,
          max: 240.0,
          value: controller.height.value,
          interval: 20,
          showTicks: true,
          showLabels: true,
          enableTooltip: true,
          thumbIcon: Icon(
            LineAwesomeIcons.ruler_vertical_solid,
            size: 20,
          ),
          minorTicksPerInterval: 1,
          onChanged: (value) {
            controller.height.value = value; // Update observable value
          },
        ),
        SizedBox(height: 30),
        Text(controller.height.value.toString()),
        const SizedBox(height: 30),
        Divider(),
        const SizedBox(height: 30),

      ]),
    );
  }
}
