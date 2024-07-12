import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getwidget/getwidget.dart';
import 'package:zawg/src/constants/colors.dart';
import '../../../core/screens/dashboard/widgets/appbar.dart';
import '../../controllers/complete_registration_controller.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: tPrimaryColor,
      appBar: DashboardAppBar(isDark: false),
      body: FlutterSteps(),
    );
  }
}
class FlutterSteps extends StatefulWidget {
  const FlutterSteps({Key? key}) : super(key: key);

  @override
  State<FlutterSteps> createState() => _FlutterStepsState();
}

class _FlutterStepsState extends State<FlutterSteps> {

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CompleteRegistrationController());
    return Scaffold(

      body: Theme(
        data: Theme.of(context)
            .copyWith(colorScheme: ColorScheme.light(primary: Colors.lightGreen)),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: controller.signupFormKey,
          child: Obx(() =>
              Stepper( // Use Obx to rebuild on currentStep changes
                steps: controller.getSteps(),
                // Assuming you have a getSteps() function
                type: StepperType.vertical,
                currentStep: controller.currentStep.value,
                onStepContinue: controller.onStepContinue,
                onStepCancel: controller.onStepCancel,
                controlsBuilder: (BuildContext context, ControlsDetails details) {
                  final bool lastStep = controller.steps -1  == controller.currentStep.toInt() ? true : false ;

                  return Row(
                    children: <Widget>[
                      GFButton(
                        onPressed: details.onStepCancel,
                        child: const Text('BACK'),
                        color: tPrimaryColor,
                      ),
                      Spacer(),
                      GFButton(
                        color: tPrimaryColor,
                        onPressed: details.onStepContinue,
                        child:  Text(lastStep  ?  'CONFIRM': "NEXT"),
                      ),

                    ],
                  );
                },

        ),
      ),
    ),
    ),
    );
  }
}
