


import 'enum.dart';



class Like {
  final String? userId;
  LikeStatus status;

  Like({required this.userId, this.status = LikeStatus.disabled});

  factory Like.fromJson(Map<String, dynamic> json) {
    LikeStatus status;
    try {
      status = LikeStatus.values.firstWhere((e) => e.toString() == json['status']);
    } catch (e) {
      status = LikeStatus.disabled; // default to disabled if invalid status
    }
    return Like(
      userId: json['userId'],
      status: status,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'status': status.toString(),
    };
  }
}
