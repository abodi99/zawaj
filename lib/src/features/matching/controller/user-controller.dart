import 'package:get/get.dart';

import '../../../constants/classes.dart';
import '../../../constants/enum.dart';
import '../../../repository/user_repository/user_repository.dart';
import '../../authentication/models/user_model.dart';
import '../../core/controllers/profile_controller.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  RxList<UserModel> likedUsers = <UserModel>[].obs;
  RxList<UserModel> matches = <UserModel>[].obs;
  RxList<UserModel> likedByUsers = <UserModel>[].obs;

  final userRepository = Get.put(UserRepository() );


  UserModel? currentUser;

  @override
  void onInit() {
    super.onInit();
    fetchCurrentUser();
  }

  void fetchCurrentUser() async {
    currentUser = await ProfileController.instance.getUserDataById();
  }

  void addLike(String? userid, LikeStatus liked, String? currentUserid) {
    addLike(userid , liked, currentUserid);
  }

  void likeUser(UserModel userModel) {
    Like like = Like(userId: userModel.id);
    likedUsers.add(userModel);
    userRepository.addLikeToDatabase(like);
  }
  /*
  void likePerson(UserModel user) {
    if (likedUsers.length < 5 && !likedUsers.contains(user)) {
      likedUsers.add(user);
      // Notify the liked user
      user.likedByUsers.add(currentUser); // Assuming `currentUser` is available
      checkForMatch(user);
    }
  }

  void checkForMatch(UserModel user) {
    if (user.likedUsers.contains(currentUser)) {
      matches.add(user);
      user.matches.add(currentUser);
      // Notify both users of the match
    }
  }

  void acceptLike(UserModel user) {
    if (!matches.contains(user)) {
      matches.add(user);
      user.matches.add(currentUser);
      // Notify the user who liked the current user
    }
  }

  void unlikePerson(UserModel user) {
    likedPersons.remove(user);
    user.likedBy.remove(currentUser);
  }


  void acceptMatch(String otherUserId) async {
    // Update current user's match status
    await _db.collection('users').doc(currentUser.id).update({
      'matchStatus': MatchStatus.accepted,
    });

    // Disable other liked users (optional logic)
    final likedUsersSnapshot = await _db.collection('users').doc(currentUser.id).get();
    final likedUserIds = likedUsersSnapshot.data()?['likedUsers']?.cast<String>() ?? [];
    for (final likedUserId in likedUserIds) {
      if (likedUserId != otherUserId) {
        await _db.collection('users').doc(likedUserId).update({
          'matchStatus': MatchStatus.disabled, // Update other liked users' status
        });
      }
    }

    // Send notification to other user (optional)
    // ...
  }

   */

}