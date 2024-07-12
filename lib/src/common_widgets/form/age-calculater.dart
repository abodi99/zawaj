import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:zawg/src/constants/colors.dart';
import 'package:zawg/src/features/authentication/controllers/complete_registration_controller.dart';



class AgeCalculater extends StatefulWidget {
  const AgeCalculater({Key? key});

  @override
  State<AgeCalculater> createState() => _AgeCalculaterState();
}

final controller = Get.put(CompleteRegistrationController());

class _AgeCalculaterState extends State<AgeCalculater> {



  @override
  Widget build(BuildContext context) {

    return Column(
      children: [


        GFButton(
          onPressed: () => pickDob(context),
          text: 'Pick Date of Birth',
          icon: Icon(Icons.cake),
          type: GFButtonType.solid,
          color: tPrimaryColor,
          shape: GFButtonShape.standard,
          size: GFSize.LARGE,
          fullWidthButton: true,

        ),
        SizedBox(height: 10,),

]
    );


  }
  pickDob(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime initialDate = DateTime(now.year - 18, now.month, now.day);
    DateTime lastDate = DateTime(now.year - 18, now.month, now.day);
    DateTime lastyear = DateTime(now.year - 60, now.month, now.day);

    showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: lastyear,
      lastDate: lastDate,
    ).then((pickedDate) {
      if (pickedDate != null) {
        calculateAge(pickedDate);
      }
    });
  }

  calculateAge(DateTime birth) {
    DateTime now = DateTime.now();
    Duration age = now.difference(birth);
    controller.age.value = (age.inDays ~/ 365).toInt();

  //  int months = (age.inDays % 365) ~/ 30;
  //  int days = ((age.inDays % 365) % 30);

  }


}
