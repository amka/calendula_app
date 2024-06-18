import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';

import '../models/user.dart';

class AuthProvider extends GetxService {
  static const _usersCollection = 'users';
  final PocketBase pocketBase;

  AuthProvider({required this.pocketBase});

  bool get isAuthenticated => pocketBase.authStore.isValid;

  Future<bool> login(String email, String password) async {
    await pocketBase
        .collection(_usersCollection)
        .authWithPassword(email, password);
    return true;
  }

  void logout() {
    pocketBase.authStore.clear();
  }

  /// Registers a new user with the given email and password.
  ///
  /// The [email] parameter is the email address of the user.
  /// The [password] parameter is the password for the user.
  ///
  /// Returns a [Future] that completes with a [User] object representing the newly registered user.
  ///
  /// Throws an exception if there was an error during the registration process.
  Future<User> register(String email, String password) async {
    final userName = email.split('@')[0];
    final record = await pocketBase.collection(_usersCollection).create(body: {
      'email': email,
      'emailVisibility': true,
      'password': password,
      'passwordConfirm': password,
      'name': userName,
    });

    return User.fromJson(record.data);
  }

  Future<User> fetchUser(String userId) async {
    final record = await pocketBase.collection(_usersCollection).getOne(userId);

    return User.fromJson(record.toJson());
  }
}
