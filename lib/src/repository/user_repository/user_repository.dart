import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../constants/classes.dart';
import '../../features/authentication/models/user_model.dart';
import '../authentication_repository/exceptions/t_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  UserRepository() {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        _getCurrentUser(user.uid);
      } else {
        _currentUser = null;
      }
    });
  }

  Future<void> _getCurrentUser(String uid) async {
    try {
      final userData = await getUserDetailsById(uid);
      _currentUser = userData;
    } catch (e) {
      print('Error getting current user: $e');
    }
  }

  /// Store user data
  Future<void> createUser(UserModel user) async {
    try {
      // It is recommended to use Authentication Id as DocumentId of the Users Collection.
      // To store a new user you first have to authenticate and get uID (e.g: Check Authentication Repository)
      // Add user like this: await _db.collection("Users").doc(uID).set(user.toJson());
      await recordExist(user.email) ? throw "Record Already Exists" : await _db.collection("Users").add(user.toJson());
    } on FirebaseAuthException catch (e) {
      final result = TExceptions.fromCode(e.code);
      throw result.message;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw e.toString().isEmpty ? 'Something went wrong. Please Try Again' : e.toString();
    }
  }

  Future<void> addLikeToDatabase(Like like) async {
    final userRef = _db.collection('Users').doc(currentUser!.id);
    print( 'User Id: ${currentUser!.id}'); // Print the user ID (should be the same as currentUser!.id);
    final doc = await userRef.get();
    if (doc.exists) {
      await userRef.update({
        'LikedUsers': FieldValue.arrayUnion([like.toJson()]),
      });
    } else {
      await userRef.set({
        'LikedUsers': [like.toJson()],
      });
    }
  }


  /// Fetch User Specific details
  Future<UserModel> getUserDetails(String email) async {
    try {
      // It is recommended to use Authentication Id as DocumentId of the Users Collection.
      // Then when fetching the record you only have to get user authenticationID uID and query as follows.
      // final snapshot = await _db.collection("Users").doc(uID).get();

      final snapshot = await _db.collection("Users").where("Email", isEqualTo: email).get();
      if (snapshot.docs.isEmpty) throw 'No such user found';

      // Single will throw exception if there are two entries when result return.
      // In case of multiple entries use .first to pick the first one without exception.
      final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
      return userData;
    } on FirebaseAuthException catch (e) {
      final result = TExceptions.fromCode(e.code);
      throw result.message;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw e.toString().isEmpty ? 'Something went wrong. Please Try Again' : e.toString();
    }
  }

  /// Fetch User Specific details by ID
  Future<UserModel> getUserDetailsById(String id) async {
    try {
      // Fetch the user document using the provided ID
      final snapshot = await _db.collection("Users").doc(id).get();
      if (!snapshot.exists) throw 'No such user found';

      // Create a UserModel from the document snapshot
      final userData = UserModel.fromSnapshot(snapshot);
      return userData;
    } on FirebaseAuthException catch (e) {
      final result = TExceptions.fromCode(e.code);
      throw result.message;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw e.toString().isEmpty ? 'Something went wrong. Please Try Again' : e.toString();
    }
  }

  /// Fetch All Users
  /// Fetch All Users
  Future<List<UserModel>> allUsers() async {
    try {
      final snapshot = await _db.collection("Users").get();
      final users = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
      print('Users Retrieved: $users'); // Print the users retrieved
      return users;
    } on FirebaseAuthException catch (e) {
      final result = TExceptions.fromCode(e.code);
      // Print the error details for debugging (including code and message)
      print('FirebaseAuthException: ${e.code} - ${result.message}');
      throw result.message; // Re-throw the exception for handling
    } on FirebaseException catch (e) {
      // Print the error details for debugging (including code and message)
      print('FirebaseException: ${e.code} - ${e.message}');
      throw e.message.toString(); // Re-throw the exception for handling
    } catch (e) {
      // Print a generic error message for unknown exceptions
      print('An unexpected error occurred: $e');
      throw 'Something went wrong. Please Try Again';
    }
  }


  /// Update User details
  Future<void> updateUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).update(user.toJson());
    } on FirebaseAuthException catch (e) {
      final result = TExceptions.fromCode(e.code);
      throw result.message;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (_) {
      throw 'Something went wrong. Please Try Again';
    }
  }

  /// Delete User Data
  Future<void> deleteUser(String id) async {
    try {
      await _db.collection("Users").doc(id).delete();
    } on FirebaseAuthException catch (e) {
      final result = TExceptions.fromCode(e.code);
      throw result.message;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (_) {
      throw 'Something went wrong. Please Try Again';
    }
  }

  /// Check if user exists with email or phoneNo
  Future<bool> recordExist(String email) async {
    try {
      final snapshot = await _db.collection("Users").where("Email", isEqualTo: email).get();
      return snapshot.docs.isEmpty ? false : true;
    } catch (e) {
      throw "Error fetching record.";
    }
  }
}
