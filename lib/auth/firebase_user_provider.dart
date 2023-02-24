import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ModernAzulFirebaseUser {
  ModernAzulFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

ModernAzulFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ModernAzulFirebaseUser> modernAzulFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ModernAzulFirebaseUser>(
      (user) {
        currentUser = ModernAzulFirebaseUser(user);
        return currentUser!;
      },
    );
