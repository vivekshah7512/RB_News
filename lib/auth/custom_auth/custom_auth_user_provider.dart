import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class RBNewsAuthUser {
  RBNewsAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<RBNewsAuthUser> rBNewsAuthUserSubject =
    BehaviorSubject.seeded(RBNewsAuthUser(loggedIn: false));
Stream<RBNewsAuthUser> rBNewsAuthUserStream() =>
    rBNewsAuthUserSubject.asBroadcastStream().map((user) => currentUser = user);
