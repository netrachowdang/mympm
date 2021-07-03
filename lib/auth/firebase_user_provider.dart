import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MyLearningFirebaseUser {
  MyLearningFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

MyLearningFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MyLearningFirebaseUser> myLearningFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<MyLearningFirebaseUser>(
            (user) => currentUser = MyLearningFirebaseUser(user));
