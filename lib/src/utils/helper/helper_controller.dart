import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';

class Helper extends GetxController {

  /* -- ============= VALIDATIONS ================ -- */

  static String? validateEmail(value) {
    if (value == null || value.isEmpty) return tEmailCannotEmpty;
    if (!GetUtils.isEmail(value)) return tInvalidEmailFormat;
    return null;
  }

  static String? validatePassword(value) {
    if (value == null || value.isEmpty) return 'Password cannot be empty';

    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Password must be 8 characters, with an uppercase letter, number and symbol';
    }
    return null;
  }


  static String? Function(String?) validateAge1() {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(),
      FormBuilderValidators.numeric(errorText: 'Enter a number'),
      FormBuilderValidators.max(60),
      FormBuilderValidators.min(18),
    ]);
  }

  static String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return "*Required.";
    }
    int age = int.tryParse(value) ?? 0;
    if (age < 18 || age > 60) {
      return "Age must be between 18 and 60.";
    }
    return null; // Validation successful
  }

  static String? validateHeight(String? value) {
    if (value == null || value.isEmpty) {
      return "*Required.";
    }
    double height = double.tryParse(value) ?? 0.0;
    if (height < 100 || height > 250) {
      return "Height must be between 100 and 250 cm.";
    }
    return null; // Validation successful
  }

  static String? validateWeight(String? value) {
    if (value == null || value.isEmpty) {
      return "*Required.";
    }
    double weight = double.tryParse(value) ?? 0.0;
    if (weight < 40 || weight > 200) {
      return "Weight must be between 40 and 200 kg.";
    }
    return null; // Validation successful
  }




  /* -- ============= SNACK-BARS ================ -- */

  static successSnackBar({required title, message}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: tWhiteColor,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 6),
      margin: const EdgeInsets.all(tDefaultSpace - 10),
      icon: const Icon(LineAwesomeIcons.check_circle, color: tWhiteColor),
    );
  }

  static warningSnackBar({required title, message}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: tWhiteColor,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 6),
      margin: const EdgeInsets.all(tDefaultSpace - 10),
      icon: const Icon(LineAwesomeIcons.exclamation_circle_solid, color: tWhiteColor),
    );
  }

  static errorSnackBar({required title, message}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: tWhiteColor,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 6),
      margin: const EdgeInsets.all(tDefaultSpace - 10),
      icon: const Icon(LineAwesomeIcons.times_circle, color: tWhiteColor),
    );
  }

  static modernSnackBar({required title, message}) {
    Get.snackbar(title, message,
        isDismissible: true,
        colorText: tWhiteColor,
        backgroundColor: Colors.blueGrey,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
        margin: const EdgeInsets.all(tDefaultSpace - 10),
    );
  }
}
