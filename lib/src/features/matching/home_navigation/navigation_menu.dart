import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:zawg/src/features/authentication/screens/complete_registration/steps/fourth_step.dart';
import 'package:zawg/src/features/authentication/screens/complete_registration/steps/third_step.dart';
import 'package:zawg/src/features/matching/home_navigation/users_screen/users.dart';
import '../../authentication/screens/complete_registration/complete_registration.dart';
import '../../core/screens/dashboard/widgets/appbar.dart';
import 'liked_by_screen/liked_by.dart';
import 'matches_screen/matches.dart';
import 'my_likes_screen/liked_poeple.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});
  // This widget is the root of your application.     It will
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Obx( () => Scaffold(
        appBar: DashboardAppBar(isDark: false),
        bottomNavigationBar: NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedValue.value,
          onDestinationSelected: (index) => controller.selectedValue.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(LineAwesomeIcons.user_friends_solid) , label: "Members"),
            NavigationDestination(icon: Icon(LineAwesomeIcons.grin_hearts) , label: "likes"),
            NavigationDestination(icon: Icon(LineAwesomeIcons.hand_holding_heart_solid) , label: "interested"),
            NavigationDestination(icon: Icon(LineAwesomeIcons.check_double_solid) , label: "Match"),

          ],
        ),
          body: controller.screen[controller.selectedValue.value],
    ),
    );
  }
}



class NavigationController extends GetxController{
  final Rx<int> selectedValue = 0.obs;

  final screen = [AllUsers(),LikedPersonsView(),LikedByView(),MatchesView()];


}