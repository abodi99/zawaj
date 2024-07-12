import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getwidget/getwidget.dart';
import 'package:zawg/src/common_widgets/form/age-calculater.dart';
import 'package:zawg/src/repository/authentication_repository/authentication_repository.dart';

import '../../../../constants/classes.dart';
import '../../../../constants/enum.dart';
import '../../../authentication/models/user_model.dart';
import '../../controller/user-controller.dart';

class User extends StatelessWidget {
  final UserModel userModel;

  const User({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController() );


    return Scaffold(
      appBar: AppBar(
        title: Text(userModel.fullName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50.0,
            ),
            const SizedBox(height: 20.0),
            Text('Gender: ${userModel.selectedGender}', style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 10.0),
            Text('Marital Status: ${userModel.maritalStatus}', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10.0),
            Text('Skin Color: ${userModel.skinColor}', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10.0),
            Text('Counties: ${userModel.counties}', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10.0),
            Text('Age: ${userModel.age.round().toString()}', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10.0),
            Text('Weight: ${userModel.weight.toString()}', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10.0),
            Text('Height: ${userModel.height.toString()}', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10.0),
            Text('Kids: ${userModel.kids.toString()}', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10.0),
            Text('Education: ${userModel.education}', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10.0),

            Text('fullName: ${userModel.fullName}', style: Theme.of(context).textTheme.titleMedium),


            GFButton(
              onPressed: () async {
                bool? confirm = await showDialog<bool>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirm'),
                      content: Text('Are you sure you want to like this user?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text('No'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Text('Yes'),
                        ),
                      ],
                    );
                  },
                );

                if (confirm == true) {
                  // Add logic to like user
                  controller.likeUser(userModel);
                }
              },
              text: "primary",
              shape: GFButtonShape.square,
              icon: Icon(
                Icons.favorite,
                //color: isLiked ? Colors.red : Colors.grey,
              ),
            ),

        GFButton(
          text: "sad",
          onPressed: () async {
            controller.likeUser(userModel);
          },
        )
          ],
        ),
      ),
    );
  }
}
