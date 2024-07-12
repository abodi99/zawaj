import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:zawg/src/constants/sizes.dart';
import 'package:zawg/src/constants/text_strings.dart';
import 'package:zawg/src/features/authentication/controllers/complete_registration_controller.dart';
import 'package:zawg/src/features/authentication/controllers/signup_controller.dart';
import 'package:zawg/src/utils/helper/helper_controller.dart';
import '../../signup/widgets/signup_form_widget.dart';

class FourthStep extends StatelessWidget {
  const FourthStep({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Column(children: [SignUpFormWidget()]);
  }
}










/*
class FourthStep extends StatelessWidget {
  const FourthStep({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CompleteRegistrationController());

    return Column(
      children: [
        TextFormField(
          controller: controller.fullName,
          validator: (value) {
            if (value!.isEmpty) return 'Name cannot be empty';
            return null;
          },
          decoration: const InputDecoration(
              label: Text(tFullName), prefixIcon: Icon(LineAwesomeIcons.user)),
        ),
        const SizedBox(height: tFormHeight - 20),
        TextFormField(
          controller: controller.email,
          validator: Helper.validateEmail,
          decoration: const InputDecoration(
              label: Text(tEmail), prefixIcon: Icon(LineAwesomeIcons.envelope)),
        ),
        const SizedBox(height: tFormHeight - 20),
        TextFormField(
          controller: controller.phoneNo,
          validator: (value) {
            if (value!.isEmpty) return 'Phone number cannot be empty';
            return null;
          },
          decoration: const InputDecoration(
              label: Text(tPhoneNo),
              prefixIcon: Icon(LineAwesomeIcons.phone_solid)),
        ),
        const SizedBox(height: tFormHeight - 20),
        Obx(
          () => TextFormField(
            controller: controller.password,
            validator: Helper.validatePassword,
            obscureText: controller.showPassword.value ? false : true,
            decoration: InputDecoration(
              label: const Text(tPassword),
              prefixIcon: const Icon(Icons.fingerprint),
              suffixIcon: IconButton(
                icon: controller.showPassword.value
                    ? const Icon(LineAwesomeIcons.eye)
                    : const Icon(LineAwesomeIcons.eye_slash),
                onPressed: () => controller.showPassword.value =
                    !controller.showPassword.value,
              ),
            ),
          ),
        ),

        /*
            Obx(
              () => TPrimaryButton(
                isLoading: controller.isLoading.value ? true : false,
                text: tSignup.tr,
                onPressed: controller.isFacebookLoading.value || controller.isGoogleLoading.value
                    ? () {}
                    : controller.isLoading.value
                        ? () {}
                        : () => controller.createUser(),
              ),
            ),
            */
      ],
    );
  }
}
*/