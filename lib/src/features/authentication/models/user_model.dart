import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../constants/classes.dart';
import '../../../constants/enum.dart'; // Assuming your enum file path

class UserModel {
  // User properties
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String skinColor;
  final int age;
  final double height;
  final double weight;
  final int kids;
  final String selectedGender;
  final bool prayer;
  final bool fasting;
  final String selectedCountry;
  final String maritalStatus;
  final bool alkohol;
  final String counties;
  final String education;

  // New fields for user roles and relationships
  final UserType userType;
  final MatchStatus matchStatus;
  final List<Like> likedUsers;  // Users the current user has liked
  final List<String> matches;      // Users the current user has matched with
  final List<String> likedByUsers;  // Users who liked the current user

  // Password (not stored in Firebase)
  final String? password;

  // Constructor (with default values for new fields)
  const UserModel({
    required this.fullName,
    required this.email,
    required this.phoneNo,
    this.skinColor = '',
    this.age = 0,
    this.height = 0.0,
    this.weight = 0.0,
    this.kids = 0,
    this.selectedGender = '',
    this.prayer = false,
    this.fasting = false,
    this.selectedCountry = '',
    this.maritalStatus = '',
    this.alkohol = false,
    this.counties = '',
    this.education = '',
    this.userType = UserType.guest,  // Set default user type
    this.matchStatus = MatchStatus.none, // Set default match status
    this.likedUsers = const [],
    this.matches = const [],
    this.likedByUsers = const [],
    this.id,
    this.password,
  });

  // Convert to JSON for storing in Firebase
  Map<String, dynamic> toJson() {
    return {
      'FullName': fullName,
      'Email': email,
      'Phone': phoneNo,
      'SkinColor': skinColor,
      'Age': age,
      'Height': height,
      'Weight': weight,
      'Kids': kids,
      'Gender': selectedGender,
      'Prayer': prayer,
      'Fasting': fasting,
      'MaritalStatus': maritalStatus,
      'Nationality': selectedCountry,
      'Alkohol': alkohol,
      'county': counties,
      'Education': education,
      'UserType': userType.toString(),
      'MatchStatus': matchStatus.toString(),
      'LikedUsers': likedUsers.map((like) => like.toJson()).toList(),
      'Matches': matches,
    };
  }

  // Empty UserModel for error handling
  static UserModel empty() => const UserModel(
    fullName: '',
    email: '',
    phoneNo: '',
  );

  // Factory constructor to create UserModel from a Firebase document snapshot
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null || document.data()!.isEmpty) return UserModel.empty();
    final data = document.data()!;
    return UserModel(
      id: document.id,
      fullName: data["FullName"] ?? '',
      email: data["Email"] ?? '',
      phoneNo: data["Phone"] ?? '',
      skinColor: data["SkinColor"] ?? '',
      age: (data["Age"] as num?)?.toInt() ?? 0,
      height: (data["Height"] as num?)?.toDouble() ?? 0.0,
      weight: (data["Weight"] as num?)?.toDouble() ?? 0.0,
      kids: (data["Kids"] as num?)?.toInt() ?? 0,
      selectedGender: data["Gender"] ?? '',
      prayer: data["Prayer"] ?? false,
      fasting: data["Fasting"] ?? false,
      selectedCountry: data["Nationality"] ?? '',
      maritalStatus: data["MaritalStatus"] ?? '',
      alkohol: data["Alkohol"] ?? false,
      counties: data["county"] ?? '',
      education: data["Education"] ?? '',
      userType: UserType.values.firstWhere((type) => type.toString() == data["UserType"], orElse: () => UserType.guest), // Parse user type
      matchStatus: MatchStatus.values.firstWhere((status) => status.toString() == data["MatchStatus"], orElse: () => MatchStatus.none), // Parse match status
      likedUsers: (data['LikedUsers'] as List).map((e) => Like.fromJson(e)).toList(),
      likedByUsers: List<String>.from(data["LikedByUsers"] ?? const []), // Convert liked by users to a list
      matches: List<String>.from(data["Matches"] ?? const []), // Convert matches to a list
    );
  }
}