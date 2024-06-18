import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';

class AuthProvider extends GetxService {
  final PocketBase pocketBase;

  AuthProvider({required this.pocketBase});

  bool get isAuthenticated => pocketBase.authStore.isValid;

  Future<bool> login(String email, String password) async {
    await pocketBase.collection('users').authWithPassword(email, password);
    return true;
  }
}
