import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../authentication/models/user_model.dart';
import '../../controller/user-controller.dart';

class LikedByView extends StatelessWidget {

  const LikedByView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Liked By'),
      ),
      body: ListView.builder(
        itemCount: controller.likedByUsers.length,
        itemBuilder: (context, index) {
          final user = controller.likedByUsers[index];
          return ListTile(
            title: Text(user.fullName),
            subtitle: Text(user.email),
            trailing: IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                // Implement accept like functionality
              },
            ),
          );
        },
      ),
    );
  }
}
