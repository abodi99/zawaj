import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../authentication/models/user_model.dart';
import '../../controller/user-controller.dart';

class MatchesView extends StatelessWidget {

  const MatchesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(UserController());



    return Scaffold(
      appBar: AppBar(
        title: Text('Matches'),
      ),
      body: ListView.builder(
        itemCount: controller.matches.length,
        itemBuilder: (context, index) {
          final user = controller.matches[index];
          return ListTile(
            title: Text(user.fullName),
            subtitle: Text(user.email),
            trailing: Icon(Icons.check),
          );
        },
      ),
    );
  }
}
