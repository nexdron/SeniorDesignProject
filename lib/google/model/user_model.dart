import 'package:firebase_auth/firebase_auth.dart';

class UserInfo{
  late final String? displayName;
  late final String? email;
  late final String? uid;
  late final UserMetadata? metadata;

  UserInfo({
    required this.displayName,
    required this.email,
    required this.uid,
    required this.metadata
  });
}
