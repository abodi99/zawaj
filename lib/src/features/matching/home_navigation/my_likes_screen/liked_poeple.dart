import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../authentication/models/user_model.dart';
import '../../controller/user-controller.dart';

class LikedPersonsView extends StatelessWidget {

  const LikedPersonsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Liked Persons'),
      ),
      body: ListView.builder(
        itemCount: controller.likedUsers.length,
        itemBuilder: (context, index) {
          final user = controller.likedUsers[index];
          return ListTile(
            title: Text(user.fullName),
            subtitle: Text(user.email),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: () {
                // Implement unlike functionality
              },
            ),
          );
        },
      ),
    );
  }
}