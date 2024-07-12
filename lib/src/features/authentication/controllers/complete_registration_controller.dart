import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:zawg/src/features/authentication/screens/complete_registration/steps/fourth_step.dart';

import '../../../constants/enum.dart';
import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../repository/user_repository/user_repository.dart';
import '../models/user_model.dart';
import '../screens/complete_registration/steps/fifth_step.dart';
import '../screens/complete_registration/steps/first_step.dart';
import '../screens/complete_registration/steps/second_step.dart';
import '../screens/complete_registration/steps/third_step.dart';

class CompleteRegistrationController extends GetxController {
  static CompleteRegistrationController get instance => Get.find();

  Rx<int> currentStep = 0.obs;
  final isCompleted = false.obs; // To track completion


  /// Loader
  final isLoading = false.obs;

  List<Widget> stepContentWidgets = [
    FirstStep(),
    SecondStep(),
    ThirdStep(),
    FourthStep(),
    FifthStep()
  ];
  List<String> titleList = [
    "appearance",
    "Religious commitment",
    "Familial Status",
    "registration",
    "Summery"
  ];

  late int steps = stepContentWidgets.length;

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  final showPassword = false.obs;

  //apperance
  Rx<Color> skinColor = Color(0xFFF8EBC8).obs;

  //Rx<int> age = 0.obs;
  Rxn<int> age= Rxn<int>();

  final weight = 150.0.obs;

  //Rxn<double> weight = Rxn<double>();
  //Rxn<double> height = Rxn<double>();
  final height = 150.0.obs;

  //religious commitment
  //Rx<Gender> selectedGender = Gender.male.obs;
  Rxn<Gender> selectedGender= Rxn<Gender>();

  //final hijab = true.obs;
  Rxn<bool> hijab = Rxn<bool>();

  //Rx<Religion> religion = Religion.Sunni.obs; // New property for religion
  Rxn<Religion> religion = Rxn<Religion>();





  Rxn<bool> prayer = Rxn<bool>();
  Rxn<bool> fasting = Rxn<bool>();
  Rxn<bool> alkohol = Rxn<bool>();
  Rxn<bool> smooking = Rxn<bool>();


  final kids = 0.obs;

  final Rxn<String> selectedCountry =  Rxn<String>();
  final Rxn<String> selectedCountryFlag =  Rxn<String>();
  final Rxn<MaritalStatus> maritalStatus = Rxn<MaritalStatus>(); // Initialize in constructor

  //Rxn<int> kids =  Rxn<int>();

  Rxn<Education> education =  Rxn<Education>();
  Rxn<SwedishCounties> Counties =  Rxn<SwedishCounties>();

  // TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();



  Rx<String> email1 = "".obs;
  Rx<String> password1 = "".obs;
  Rx<String> fullname1 = "".obs;
  Rx<String> phone1 = "".obs;




  bool validateForm() {
    switch (currentStep.value) {
      case 0:
        if (age.value == null) {
          Get.snackbar('Error', 'Please enter your age');
          return false;
        }
      case 1:

        if (selectedGender.value == null) {
          Get.snackbar('Error', 'please select a gender');
          return false;
        }
        else if (religion.value == null) {
          Get.snackbar('Error', 'Sunni or Shia?');
          return false;
        }
        else if(prayer.value == null) {
            Get.snackbar('Error', 'Do you pray');
          return false;
        }
        else if(fasting.value == null) {
          Get.snackbar('Error', 'Do you fast');
          return false;
        }
        else if(alkohol.value == null) {
          Get.snackbar('Error', 'Do you drink ? ');
          return false;
        }
        else if(smooking.value == null) {
          Get.snackbar('Error', 'Do you smook?');
          return false;
        }
      case 2:
        if (maritalStatus.value == null) {
          Get.snackbar('Error', 'Please enter your marital status');
          return false;
        }
        else if(kids.value == null) {
          Get.snackbar('Error', 'Please enter your kids');
          return false;
        }
        else if(Counties.value == null) {
          Get.snackbar('Error', 'Please enter your country');
          return false;
        }
        else if(education.value == null) {
          Get.snackbar('Error', 'Please enter your education');
          return false;
        }
      case 3:
        if (!signupFormKey.currentState!.validate()) {
          return false;
        }

      default:
        return true; // Assume all other steps are valid by default
    }
    return true;
  }



  void onStepContinue() {

    if (validateForm()) {
      if (currentStep == 3) {
        signupFormKey.currentState!.save();
      }

      if (currentStep == 4) {
        createUser();
        return;
      }

      currentStep.value += 1;
    }

    }

  void onStepCancel() {
    if (currentStep.value == 0) {
      return;
    } else if (currentStep.value > 0) {
      currentStep.value -= 1;
    }
  }

  bool isStepActive(int index) {
    return currentStep.value >= index ? true : false;
  }

  StepState stepState(int index) {
    return currentStep > index ? StepState.complete : StepState.editing;
  }

  List<Step> getSteps() {
    List<Step> steps = [];
    for (int i = 0; i < stepContentWidgets.length; i++) {
      steps.add(
        Step(
          title: Text(titleList[i]),
          state: stepState(i),
          isActive: isStepActive(i + 1),
          content: stepContentWidgets[i],
        ),
      );
    }

    return steps;
  }

  Future<void> createUser() async {
    try {
      isLoading.value = true;
      if (!signupFormKey.currentState!.validate()) {
        isLoading.value = false;
        return;
      }

      // Get all user data
      final user = UserModel(
        fullName: fullname1.trim(),
        email: email1.trim(),
        phoneNo: phone1.trim(),
        skinColor: skinColor.value.toString(), // Assuming skinColor is an Rx<Color>
        age: age.value!,
        height: height.value,
        weight: weight.value!,
        kids: kids.value,
        selectedGender: selectedGender.value!.name,
        prayer: prayer.value!,
        fasting: fasting.value!,
        selectedCountry: selectedCountry.value!,
        maritalStatus: maritalStatus.value!.name,
        alkohol: alkohol.value!,
        counties: Counties.value!.name,
        education: education.value!.name,
        userType: UserType.unverified,  // Set default user type
        matchStatus: MatchStatus.none, // Set default match status
        likedUsers: const [],
        matches: const [],
        likedByUsers: const [],
        password: password1.trim(),
      );

      // Authenticate User first
      final auth = AuthenticationRepository.instance;
      await auth.registerWithEmailAndPassword(user.email, user.password!);

      // Create user in database (after successful authentication)
      await UserRepository.instance.createUser(user);

      // Set initial screen based on authentication status
      auth.setInitialScreen(auth.firebaseUser);
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
      );
    }
  }

}
