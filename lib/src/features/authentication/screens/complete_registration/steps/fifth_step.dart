import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../controllers/complete_registration_controller.dart';

class FifthStep extends StatelessWidget {
  const FifthStep({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CompleteRegistrationController());

    return  Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text("Skin color : "),
              Spacer(),
              Container(
                  width: 20, height: 20, color: controller.skinColor.value),
              //i want a sized box with background color
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("age : "),
              Spacer(),
              Text(" ${controller.age.value?.round().toString()}"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("Height : "),
              Spacer(),
              Text(" ${controller.height.value.round().toString()}"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("Weight : "),
              Spacer(),
              Text(" ${controller.weight.value?.round().toString()}"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("Gender : "),
              Spacer(),
              Text(" ${controller.selectedGender.value?.name}"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("prayerFrequency : "),
              Spacer(),
              Text(" ${controller.prayer.value}"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("fastingFrequency : "),
              Spacer(),
              Text(" ${controller.fasting.value}"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("alkohol : "),
              Spacer(),
              Text( controller.alkohol.value != null ? controller.alkohol.value.toString() : controller.alkohol.value.toString()),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("nationality : "),
              Spacer(),
              Text(" ${controller.selectedCountry.value} "),
              Text(" ${controller.selectedCountryFlag.value}"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("maritalStatus : "),
              Spacer(),
              Text(" ${controller.maritalStatus.value!.name}"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("kids : "),
              Spacer(),
              Text(" ${controller.kids.value}"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("Counties : "),
              Spacer(),
              Text(" ${controller.Counties.value!.name}"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("education : "),
              Spacer(),
              Text(" ${controller.education.value!.name}"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("email : "),
              Spacer(),
              Text(" ${controller.email1}"),
            ],
          ),
          SizedBox(
            height: 10,
          ),

          Row(
            children: [
              Text("name : "),
              Spacer(),
              Text(" ${controller.fullname1}"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("name : "),
              Spacer(),
              Text(" ${controller.password1}"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

